from __future__ import annotations

from pycircuit import Circuit, Wire, jit_inline

from ..isa import (
    BK_CALL,
    BK_COND,
    BK_FALL,
    BK_RET,
    OP_BSTART_STD_CALL,
    OP_C_BSTART_COND,
    OP_C_BSTART_STD,
    OP_C_LWI,
    OP_C_SETC_EQ,
    OP_C_SETC_TGT,
    OP_C_SWI,
    OP_C_BSTOP,
    OP_SWI,
    REG_INVALID,
    ST_EX,
    ST_ID,
    ST_IF,
    ST_MEM,
    ST_WB,
)
from ..pipeline import CoreState, MemWbRegs, RegFiles
from ..regfile import commit_gpr, commit_stack, stack_next


@jit_inline
def build_wb_stage(
    m: Circuit,
    *,
    do_wb: Wire,
    stage_is_if: Wire,
    stage_is_id: Wire,
    stage_is_ex: Wire,
    stage_is_mem: Wire,
    stage_is_wb: Wire,
    stop: Wire,
    halt_set: Wire,
    state: CoreState,
    memwb: MemWbRegs,
    rf: RegFiles,
) -> None:
    with m.scope("WB"):
        # Stage inputs.
        stage = state.stage.out()
        pc = state.pc.out()
        br_kind = state.br_kind.out()
        br_base_pc = state.br_base_pc.out()
        br_off = state.br_off.out()
        commit_cond = state.commit_cond.out()
        commit_tgt = state.commit_tgt.out()

        op = memwb.op.out()
        len_bytes = memwb.len_bytes.out()
        regdst = memwb.regdst.out()
        value = memwb.value.out()

        # Halt flag (latches even when stop inhibits do_wb).
        state.halted.set(1, when=halt_set)

        # --- BlockISA control flow ---
        op_c_bstart_std = op == OP_C_BSTART_STD
        op_c_bstart_cond = op == OP_C_BSTART_COND
        op_bstart_call = op == OP_BSTART_STD_CALL
        op_c_bstop = op == OP_C_BSTOP

        op_is_start_marker = op_c_bstart_std | op_c_bstart_cond | op_bstart_call
        op_is_boundary = op_is_start_marker | op_c_bstop

        br_is_cond = br_kind == BK_COND
        br_is_call = br_kind == BK_CALL
        br_is_ret = br_kind == BK_RET

        br_target_pc = br_base_pc + br_off
        if br_is_ret:
            br_target_pc = commit_tgt

        br_take = br_is_call | br_is_ret | (br_is_cond & commit_cond)

        pc_inc = pc + len_bytes
        pc_next = pc_inc
        if op_is_boundary & br_take:
            pc_next = br_target_pc
        state.pc.set(pc_next, when=do_wb)

        # Stage machine: IF -> ID -> EX -> MEM -> WB -> IF, gated by stop.
        stage_seq = stage
        if stage_is_if:
            stage_seq = ST_ID
        if stage_is_id:
            stage_seq = ST_EX
        if stage_is_ex:
            stage_seq = ST_MEM
        if stage_is_mem:
            stage_seq = ST_WB
        if stage_is_wb:
            stage_seq = ST_IF
        state.stage.set(stage_seq, when=~stop)

        # Cycle counter (always increments; TB stops on halt).
        state.cycles.set(state.cycles.out() + 1)

        # --- Block control state updates ---
        # Commit-argument setters.
        op_c_setc_eq = op == OP_C_SETC_EQ
        op_c_setc_tgt = op == OP_C_SETC_TGT

        commit_cond_next = commit_cond
        commit_tgt_next = commit_tgt
        # Clear commit args at any boundary marker (start of a new basic block or an explicit stop).
        if do_wb & op_is_boundary:
            commit_cond_next = 0
            commit_tgt_next = 0
        if do_wb & op_c_setc_eq:
            commit_cond_next = value[0]
        if do_wb & op_c_setc_tgt:
            commit_tgt_next = value
        state.commit_cond.set(commit_cond_next)
        state.commit_tgt.set(commit_tgt_next)

        # Block-transition kind for the *current* block is set by the most recently executed start marker.
        # When a branch/call/ret is taken at a boundary, reset br_kind to FALL so the next marker doesn't
        # immediately re-commit the previous transition.
        br_kind_next = br_kind
        br_base_next = br_base_pc
        br_off_next = br_off

        # Default reset when leaving a block via any boundary.
        if do_wb & op_is_boundary & br_take:
            br_kind_next = BK_FALL
            br_base_next = pc
            br_off_next = 0

        enter_new_block = do_wb & op_is_start_marker & (~br_take)

        # C.BSTART COND,label: conditional transition with PC-relative target offset (imm << 1).
        if enter_new_block & op_c_bstart_cond:
            br_kind_next = BK_COND
            br_base_next = pc
            br_off_next = value

        # BSTART.STD CALL,label: unconditional call transition to PC-relative target offset (imm << 1).
        if enter_new_block & op_bstart_call:
            br_kind_next = BK_CALL
            br_base_next = pc
            br_off_next = value

        # C.BSTART.STD BrType: fall-through (BrType=1) or return (BrType=7).
        brtype = value[0:3]
        kind_from_brtype = BK_FALL
        if brtype == 7:
            kind_from_brtype = BK_RET
        if enter_new_block & op_c_bstart_std:
            br_kind_next = kind_from_brtype
            br_base_next = pc
            br_off_next = 0

        # Explicit block stop ends the current block without starting a new one.
        if do_wb & op_c_bstop:
            br_kind_next = BK_FALL
            br_base_next = pc
            br_off_next = 0

        state.br_kind.set(br_kind_next)
        state.br_base_pc.set(br_base_next)
        state.br_off.set(br_off_next)

        # Register writeback + T/U stacks.
        wb_is_store = (op == OP_SWI) | (op == OP_C_SWI)
        do_reg_write = do_wb & (~wb_is_store) & (regdst != REG_INVALID)

        do_clear_hands = do_wb & op_is_start_marker
        do_push_t = do_wb & (op == OP_C_LWI)

        do_push_t = do_push_t | (do_reg_write & (regdst == 31))
        do_push_u = do_reg_write & (regdst == 30)

        commit_gpr(m, rf.gpr, do_reg_write=do_reg_write, regdst=memwb.regdst, value=memwb.value)

        t_next = stack_next(m, rf.t, do_push=do_push_t, do_clear=do_clear_hands, value=memwb.value)
        u_next = stack_next(m, rf.u, do_push=do_push_u, do_clear=do_clear_hands, value=memwb.value)
        commit_stack(m, rf.t, t_next)
        commit_stack(m, rf.u, u_next)
