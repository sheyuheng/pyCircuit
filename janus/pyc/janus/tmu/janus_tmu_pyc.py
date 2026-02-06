from __future__ import annotations

from pycircuit import Circuit

from janus.tmu.flit import pack_req_meta, pack_rsp_meta, unpack_req_meta, unpack_rsp_meta
from janus.tmu.node import and_all, build_mgb, build_spb
from janus.tmu.station import CC_NEXT, CW_NEXT, build_pipe_state, build_req_ring, build_rsp_ring, dir_cw


def _build_tmu(
    m: Circuit,
    *,
    tile_bytes: int = (1 << 20),
    tag_w: int | None = None,
    addr_w: int = 20,
    idx_w: int | None = None,
) -> None:
    DATA_BYTES = 256
    WORD_W = 64
    STRB_W = 8

    if DATA_BYTES % 8 != 0:
        raise ValueError("DATA_BYTES must be a multiple of 8")

    if tile_bytes % (8 * DATA_BYTES) != 0:
        raise ValueError("tile_bytes must be divisible by 8 * line_bytes")
    pipe_bytes = tile_bytes // 8
    lines_per_pipe = pipe_bytes // DATA_BYTES
    if lines_per_pipe <= 0:
        raise ValueError("tile_bytes too small for line_bytes")
    if idx_w is None:
        idx_w = max(1, (lines_per_pipe - 1).bit_length())

    DATA_WORDS = DATA_BYTES // 8
    if tag_w is None:
        tag_w = addr_w
    if tag_w < 11 + idx_w:
        raise ValueError("tag_w must cover address bits [10:8] and [19:11]")
    REQ_META_W = tag_w + 1 + 3
    RSP_META_W = tag_w + 1 + 3
    if REQ_META_W > 64 or RSP_META_W > 64:
        raise ValueError("meta width exceeds 64b emitter limit")

    c = m.const_wire

    clk = m.clock("clk")
    rst = m.reset("rst")

    req_valid = []
    req_ready = []
    req_write = []
    req_addr = []
    req_tag = []
    req_wdata_words = []
    req_wstrb_words = []

    rsp_valid = []
    rsp_ready = []
    rsp_tag = []
    rsp_rdata_words = []

    for i in range(8):
        req_valid.append(m.in_wire(f"n{i}_req_valid", width=1))
        req_write.append(m.in_wire(f"n{i}_req_write", width=1))
        req_addr.append(m.in_wire(f"n{i}_req_addr", width=addr_w))
        req_tag.append(m.in_wire(f"n{i}_req_tag", width=tag_w))
        req_wdata_words.append([m.in_wire(f"n{i}_req_wdata_w{w}", width=WORD_W) for w in range(DATA_WORDS)])
        req_wstrb_words.append([m.in_wire(f"n{i}_req_wstrb_w{w}", width=STRB_W) for w in range(DATA_WORDS)])
        rsp_ready.append(m.in_wire(f"n{i}_rsp_ready", width=1))

        req_ready.append(m.named_wire(f"n{i}_req_ready", width=1))
        rsp_valid.append(m.named_wire(f"n{i}_rsp_valid", width=1))
        rsp_tag.append(m.named_wire(f"n{i}_rsp_tag", width=tag_w))
        rsp_rdata_words.append([m.named_wire(f"n{i}_rsp_rdata_w{w}", width=WORD_W) for w in range(DATA_WORDS)])

    # --- SPB per node (req) ---
    spb_count = []
    spb_cw_meta_q = []
    spb_cc_meta_q = []
    spb_cw_data_q = []
    spb_cc_data_q = []
    spb_cw_strb_q = []
    spb_cc_strb_q = []
    spb_push_fire = []
    spb_pop_fire_cw = [c(0, width=1) for _ in range(8)]
    spb_pop_fire_cc = [c(0, width=1) for _ in range(8)]

    for i in range(8):
        spb_i = build_spb(
            m,
            idx=i,
            clk=clk,
            rst=rst,
            req_meta_w=REQ_META_W,
            data_words=DATA_WORDS,
            word_w=WORD_W,
            strb_w=STRB_W,
        )
        spb_count.append(spb_i.count)
        spb_cw_meta_q.append(spb_i.cw_meta_q)
        spb_cc_meta_q.append(spb_i.cc_meta_q)
        spb_cw_data_q.append(spb_i.cw_data_q)
        spb_cc_data_q.append(spb_i.cc_data_q)
        spb_cw_strb_q.append(spb_i.cw_strb_q)
        spb_cc_strb_q.append(spb_i.cc_strb_q)
        spb_push_fire.append(spb_i.push_fire)

    # --- Ring state (up ring for requests) ---
    req_ring = build_req_ring(
        m,
        clk=clk,
        rst=rst,
        meta_w=REQ_META_W,
        data_words=DATA_WORDS,
        word_w=WORD_W,
        strb_w=STRB_W,
    )
    req_cw_valid = [s.cw_valid for s in req_ring]
    req_cw_meta = [s.cw_meta for s in req_ring]
    req_cw_data = [s.cw_data for s in req_ring]
    req_cw_strb = [s.cw_strb for s in req_ring]
    req_cc_valid = [s.cc_valid for s in req_ring]
    req_cc_meta = [s.cc_meta for s in req_ring]
    req_cc_data = [s.cc_data for s in req_ring]
    req_cc_strb = [s.cc_strb for s in req_ring]

    # --- TileReg memories (8 pipes, 32x64b per line) ---
    pipe_rdata_words = []
    pipe_ren = []
    pipe_wvalid = []
    pipe_addr = []
    pipe_wdata_words = []
    pipe_wstrb_words = []

    for p in range(8):
        with m.scope(f"pipe{p}__mem"):
            pipe_ren.append(m.named_wire("ren", width=1))
            pipe_wvalid.append(m.named_wire("wvalid", width=1))
            pipe_addr.append(m.named_wire("addr", width=idx_w))
            pipe_wdata_words.append([m.named_wire(f"wdata{w}", width=WORD_W) for w in range(DATA_WORDS)])
            pipe_wstrb_words.append([m.named_wire(f"wstrb{w}", width=STRB_W) for w in range(DATA_WORDS)])
            addr_word = m.cat(pipe_addr[p], c(0, width=3))
            rwords = []
            for w in range(DATA_WORDS):
                r = m.byte_mem(
                    clk,
                    rst,
                    raddr=addr_word,
                    wvalid=pipe_wvalid[p],
                    waddr=addr_word,
                    wdata=pipe_wdata_words[p][w],
                    wstrb=pipe_wstrb_words[p][w],
                    depth=lines_per_pipe * 8,
                    name=f"pipe{p}_w{w}",
                )
                rwords.append(r)
            pipe_rdata_words.append(rwords)

    # --- Down ring (responses) ---
    rsp_ring = build_rsp_ring(
        m,
        clk=clk,
        rst=rst,
        meta_w=RSP_META_W,
        data_words=DATA_WORDS,
        word_w=WORD_W,
    )
    rsp_cw_valid = [s.cw_valid for s in rsp_ring]
    rsp_cw_meta = [s.cw_meta for s in rsp_ring]
    rsp_cw_data = [s.cw_data for s in rsp_ring]
    rsp_cc_valid = [s.cc_valid for s in rsp_ring]
    rsp_cc_meta = [s.cc_meta for s in rsp_ring]
    rsp_cc_data = [s.cc_data for s in rsp_ring]

    # --- MGB per node (rsp) ---
    mgb_count = []
    mgb_rr = []
    mgb_cw_meta_q = []
    mgb_cc_meta_q = []
    mgb_cw_data_q = []
    mgb_cc_data_q = []
    for i in range(8):
        mgb_i = build_mgb(
            m,
            idx=i,
            clk=clk,
            rst=rst,
            rsp_meta_w=RSP_META_W,
            data_words=DATA_WORDS,
            word_w=WORD_W,
        )
        mgb_count.append(mgb_i.count)
        mgb_rr.append(mgb_i.rr)
        mgb_cw_meta_q.append(mgb_i.cw_meta_q)
        mgb_cc_meta_q.append(mgb_i.cc_meta_q)
        mgb_cw_data_q.append(mgb_i.cw_data_q)
        mgb_cc_data_q.append(mgb_i.cc_data_q)

    # --- SPB push (req ingress) ---
    for i in range(8):
        tag_addr = req_tag[i]
        addr_pipe = tag_addr.slice(lsb=8, width=3)

        route_cw = dir_cw(m, addr_pipe, i)
        count_ok = ~spb_count[i].out().slice(lsb=2, width=1)

        cw_ready_all = and_all(
            [spb_cw_meta_q[i].in_ready]
            + [q.in_ready for q in spb_cw_data_q[i]]
            + [q.in_ready for q in spb_cw_strb_q[i]]
        )
        cc_ready_all = and_all(
            [spb_cc_meta_q[i].in_ready]
            + [q.in_ready for q in spb_cc_data_q[i]]
            + [q.in_ready for q in spb_cc_strb_q[i]]
        )
        ready_sel = route_cw.select(cw_ready_all, cc_ready_all)
        rdy = count_ok & ready_sel
        m.assign(req_ready[i], rdy)

        req_fire = req_valid[i] & rdy

        req_meta = pack_req_meta(
            m,
            tag=tag_addr,
            is_write=req_write[i],
            src=c(i, width=3),
        )

        when_cw = req_fire & route_cw
        when_cc = req_fire & (~route_cw)

        spb_cw_meta_q[i].push(req_meta, when=when_cw)
        spb_cc_meta_q[i].push(req_meta, when=when_cc)
        for w in range(DATA_WORDS):
            spb_cw_data_q[i][w].push(req_wdata_words[i][w], when=when_cw)
            spb_cc_data_q[i][w].push(req_wdata_words[i][w], when=when_cc)
            spb_cw_strb_q[i][w].push(req_wstrb_words[i][w], when=when_cw)
            spb_cc_strb_q[i][w].push(req_wstrb_words[i][w], when=when_cc)

        m.assign(spb_push_fire[i], when_cw | when_cc)

    # --- req ring shift + inject ---
    req_cw_fwd_valid = [c(0, width=1) for _ in range(8)]
    req_cw_fwd_meta = [c(0, width=REQ_META_W) for _ in range(8)]
    req_cw_fwd_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_cw_fwd_strb = [[c(0, width=STRB_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_cc_fwd_valid = [c(0, width=1) for _ in range(8)]
    req_cc_fwd_meta = [c(0, width=REQ_META_W) for _ in range(8)]
    req_cc_fwd_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_cc_fwd_strb = [[c(0, width=STRB_W) for _ in range(DATA_WORDS)] for _ in range(8)]

    req_arr_cw_valid = [c(0, width=1) for _ in range(8)]
    req_arr_cw_meta = [c(0, width=REQ_META_W) for _ in range(8)]
    req_arr_cw_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_arr_cw_strb = [[c(0, width=STRB_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_arr_cc_valid = [c(0, width=1) for _ in range(8)]
    req_arr_cc_meta = [c(0, width=REQ_META_W) for _ in range(8)]
    req_arr_cc_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_arr_cc_strb = [[c(0, width=STRB_W) for _ in range(DATA_WORDS)] for _ in range(8)]

    for i in range(8):
        cur_v = req_cw_valid[i].out()
        cur_meta = req_cw_meta[i].out()
        dec = unpack_req_meta(cur_meta, tag_w=tag_w)
        dest_eq = dec["tag"].slice(lsb=8, width=3).eq(c(i, width=3))
        consume = cur_v & dest_eq
        req_arr_cw_valid[i] = consume
        req_arr_cw_meta[i] = cur_meta
        for w in range(DATA_WORDS):
            req_arr_cw_data[i][w] = req_cw_data[i][w].out()
            req_arr_cw_strb[i][w] = req_cw_strb[i][w].out()
        forward = cur_v & (~dest_eq)
        nxt = CW_NEXT[i]
        req_cw_fwd_valid[nxt] = forward
        req_cw_fwd_meta[nxt] = cur_meta
        for w in range(DATA_WORDS):
            req_cw_fwd_data[nxt][w] = req_cw_data[i][w].out()
            req_cw_fwd_strb[nxt][w] = req_cw_strb[i][w].out()

    for i in range(8):
        cur_v = req_cc_valid[i].out()
        cur_meta = req_cc_meta[i].out()
        dec = unpack_req_meta(cur_meta, tag_w=tag_w)
        dest_eq = dec["tag"].slice(lsb=8, width=3).eq(c(i, width=3))
        consume = cur_v & dest_eq
        req_arr_cc_valid[i] = consume
        req_arr_cc_meta[i] = cur_meta
        for w in range(DATA_WORDS):
            req_arr_cc_data[i][w] = req_cc_data[i][w].out()
            req_arr_cc_strb[i][w] = req_cc_strb[i][w].out()
        forward = cur_v & (~dest_eq)
        nxt = CC_NEXT[i]
        req_cc_fwd_valid[nxt] = forward
        req_cc_fwd_meta[nxt] = cur_meta
        for w in range(DATA_WORDS):
            req_cc_fwd_data[nxt][w] = req_cc_data[i][w].out()
            req_cc_fwd_strb[nxt][w] = req_cc_strb[i][w].out()

    req_cw_next_valid = [c(0, width=1) for _ in range(8)]
    req_cw_next_meta = [c(0, width=REQ_META_W) for _ in range(8)]
    req_cw_next_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_cw_next_strb = [[c(0, width=STRB_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_cc_next_valid = [c(0, width=1) for _ in range(8)]
    req_cc_next_meta = [c(0, width=REQ_META_W) for _ in range(8)]
    req_cc_next_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    req_cc_next_strb = [[c(0, width=STRB_W) for _ in range(DATA_WORDS)] for _ in range(8)]

    for i in range(8):
        inject_ready = ~req_cw_fwd_valid[i]
        cw_out_valid_all = and_all(
            [spb_cw_meta_q[i].out_valid]
            + [q.out_valid for q in spb_cw_data_q[i]]
            + [q.out_valid for q in spb_cw_strb_q[i]]
        )
        pop_when = inject_ready & cw_out_valid_all
        pop_meta = spb_cw_meta_q[i].pop(when=pop_when).data
        pop_data = []
        pop_strb = []
        for w in range(DATA_WORDS):
            pop_data.append(spb_cw_data_q[i][w].pop(when=pop_when).data)
            pop_strb.append(spb_cw_strb_q[i][w].pop(when=pop_when).data)
        spb_pop_fire_cw[i] = pop_when
        req_cw_next_valid[i] = req_cw_fwd_valid[i] | pop_when
        req_cw_next_meta[i] = req_cw_fwd_valid[i].select(req_cw_fwd_meta[i], pop_meta)
        for w in range(DATA_WORDS):
            req_cw_next_data[i][w] = req_cw_fwd_valid[i].select(req_cw_fwd_data[i][w], pop_data[w])
            req_cw_next_strb[i][w] = req_cw_fwd_valid[i].select(req_cw_fwd_strb[i][w], pop_strb[w])

    for i in range(8):
        inject_ready = ~req_cc_fwd_valid[i]
        cc_out_valid_all = and_all(
            [spb_cc_meta_q[i].out_valid]
            + [q.out_valid for q in spb_cc_data_q[i]]
            + [q.out_valid for q in spb_cc_strb_q[i]]
        )
        pop_when = inject_ready & cc_out_valid_all
        pop_meta = spb_cc_meta_q[i].pop(when=pop_when).data
        pop_data = []
        pop_strb = []
        for w in range(DATA_WORDS):
            pop_data.append(spb_cc_data_q[i][w].pop(when=pop_when).data)
            pop_strb.append(spb_cc_strb_q[i][w].pop(when=pop_when).data)
        spb_pop_fire_cc[i] = pop_when
        req_cc_next_valid[i] = req_cc_fwd_valid[i] | pop_when
        req_cc_next_meta[i] = req_cc_fwd_valid[i].select(req_cc_fwd_meta[i], pop_meta)
        for w in range(DATA_WORDS):
            req_cc_next_data[i][w] = req_cc_fwd_valid[i].select(req_cc_fwd_data[i][w], pop_data[w])
            req_cc_next_strb[i][w] = req_cc_fwd_valid[i].select(req_cc_fwd_strb[i][w], pop_strb[w])

    for i in range(8):
        req_cw_valid[i].set(req_cw_next_valid[i])
        req_cw_meta[i].set(req_cw_next_meta[i])
        for w in range(DATA_WORDS):
            req_cw_data[i][w].set(req_cw_next_data[i][w])
            req_cw_strb[i][w].set(req_cw_next_strb[i][w])
        req_cc_valid[i].set(req_cc_next_valid[i])
        req_cc_meta[i].set(req_cc_next_meta[i])
        for w in range(DATA_WORDS):
            req_cc_data[i][w].set(req_cc_next_data[i][w])
            req_cc_strb[i][w].set(req_cc_next_strb[i][w])

    # --- SPB count update ---
    for i in range(8):
        with m.scope(f"spb{i}__count"):
            cnt = spb_count[i].out()
            push = spb_push_fire[i].zext(width=3)
            pop2 = spb_pop_fire_cw[i].zext(width=2) + spb_pop_fire_cc[i].zext(width=2)
            pop_dec = pop2.eq(c(0, width=2)).select(
                c(0, width=3),
                pop2.eq(c(1, width=2)).select(c(7, width=3), c(6, width=3)),
            )
            spb_count[i].set(cnt + push + pop_dec)

    # --- rsp ring forward/arrive (for slot availability + MGB) ---
    rsp_cw_fwd_valid = [c(0, width=1) for _ in range(8)]
    rsp_cw_fwd_meta = [c(0, width=RSP_META_W) for _ in range(8)]
    rsp_cw_fwd_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    rsp_cc_fwd_valid = [c(0, width=1) for _ in range(8)]
    rsp_cc_fwd_meta = [c(0, width=RSP_META_W) for _ in range(8)]
    rsp_cc_fwd_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]

    rsp_arr_cw = [c(0, width=1) for _ in range(8)]
    rsp_arr_cw_meta = [c(0, width=RSP_META_W) for _ in range(8)]
    rsp_arr_cw_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    rsp_arr_cc = [c(0, width=1) for _ in range(8)]
    rsp_arr_cc_meta = [c(0, width=RSP_META_W) for _ in range(8)]
    rsp_arr_cc_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]

    for i in range(8):
        cur_v = rsp_cw_valid[i].out()
        cur_meta = rsp_cw_meta[i].out()
        dec = unpack_rsp_meta(cur_meta, tag_w=tag_w)
        dest_eq = dec["dest"].eq(c(i, width=3))
        arr = cur_v & dest_eq
        rsp_arr_cw[i] = arr
        rsp_arr_cw_meta[i] = cur_meta
        for w in range(DATA_WORDS):
            rsp_arr_cw_data[i][w] = rsp_cw_data[i][w].out()
        forward = cur_v & (~dest_eq)
        nxt = CW_NEXT[i]
        rsp_cw_fwd_valid[nxt] = forward
        rsp_cw_fwd_meta[nxt] = cur_meta
        for w in range(DATA_WORDS):
            rsp_cw_fwd_data[nxt][w] = rsp_cw_data[i][w].out()

    for i in range(8):
        cur_v = rsp_cc_valid[i].out()
        cur_meta = rsp_cc_meta[i].out()
        dec = unpack_rsp_meta(cur_meta, tag_w=tag_w)
        dest_eq = dec["dest"].eq(c(i, width=3))
        arr = cur_v & dest_eq
        rsp_arr_cc[i] = arr
        rsp_arr_cc_meta[i] = cur_meta
        for w in range(DATA_WORDS):
            rsp_arr_cc_data[i][w] = rsp_cc_data[i][w].out()
        forward = cur_v & (~dest_eq)
        nxt = CC_NEXT[i]
        rsp_cc_fwd_valid[nxt] = forward
        rsp_cc_fwd_meta[nxt] = cur_meta
        for w in range(DATA_WORDS):
            rsp_cc_fwd_data[nxt][w] = rsp_cc_data[i][w].out()

    # --- Pipe arbitration + mem access ---
    pipe_rr = []
    pipe_stage_valid = []
    pipe_stage_is_write = []
    pipe_stage_src = []
    pipe_stage_tag = []
    pipe_stage_rdata_words = []

    for p in range(8):
        pipe_state = build_pipe_state(
            m,
            pipe=p,
            clk=clk,
            rst=rst,
            tag_w=tag_w,
            data_words=DATA_WORDS,
            word_w=WORD_W,
        )
        pipe_rr.append(pipe_state.rr)
        pipe_stage_valid.append(pipe_state.stage_valid)
        pipe_stage_is_write.append(pipe_state.stage_is_write)
        pipe_stage_src.append(pipe_state.stage_src)
        pipe_stage_tag.append(pipe_state.stage_tag)
        pipe_stage_rdata_words.append(pipe_state.stage_rdata_words)

    for p in range(8):
        with m.scope(f"pipe{p}__arb"):
            cw_v = req_arr_cw_valid[p]
            cc_v = req_arr_cc_valid[p]
            rr = pipe_rr[p].out()

            sel_cw = cw_v & (~cc_v | ~rr)
            sel_cc = cc_v & (~cw_v | rr)
            issue_raw = sel_cw | sel_cc

            stage_src = pipe_stage_src[p].out()
            resp_dir_cw = dir_cw(m, stage_src, p)
            resp_slot_free = resp_dir_cw.select(~rsp_cw_fwd_valid[p], ~rsp_cc_fwd_valid[p])
            stall = pipe_stage_valid[p].out() & (~resp_slot_free)
            issue = issue_raw & (~stall)

            sel_meta = sel_cw.select(req_arr_cw_meta[p], req_arr_cc_meta[p])
            dec = unpack_req_meta(sel_meta, tag_w=tag_w)
            addr_idx = dec["tag"].slice(lsb=11, width=idx_w)

            ren = issue & (~dec["is_write"])
            wvalid = issue & dec["is_write"]
            m.assign(pipe_ren[p], ren)
            m.assign(pipe_wvalid[p], wvalid)
            m.assign(pipe_addr[p], addr_idx)
            for w in range(DATA_WORDS):
                sel_data = sel_cw.select(req_arr_cw_data[p][w], req_arr_cc_data[p][w])
                sel_strb = sel_cw.select(req_arr_cw_strb[p][w], req_arr_cc_strb[p][w])
                m.assign(pipe_wdata_words[p][w], sel_data)
                m.assign(pipe_wstrb_words[p][w], sel_strb)

            # stage hold when stalled
            stage_v_next = stall.select(pipe_stage_valid[p].out(), issue)
            stage_w_next = stall.select(pipe_stage_is_write[p].out(), issue.select(dec["is_write"], c(0, width=1)))
            stage_src_next = stall.select(pipe_stage_src[p].out(), issue.select(dec["src"], c(0, width=3)))
            stage_tag_next = stall.select(pipe_stage_tag[p].out(), issue.select(dec["tag"], c(0, width=tag_w)))

            pipe_stage_valid[p].set(stage_v_next)
            pipe_stage_is_write[p].set(stage_w_next)
            pipe_stage_src[p].set(stage_src_next)
            pipe_stage_tag[p].set(stage_tag_next)

            for w in range(DATA_WORDS):
                rdata_word = dec["is_write"].select(c(0, width=WORD_W), pipe_rdata_words[p][w])
                stage_word_next = stall.select(
                    pipe_stage_rdata_words[p][w].out(),
                    issue.select(rdata_word, c(0, width=WORD_W)),
                )
                pipe_stage_rdata_words[p][w].set(stage_word_next)

            rr_toggle = issue & cw_v & cc_v
            pipe_rr[p].set(rr_toggle.select(~rr, rr))

    # --- rsp ring inject ---
    rsp_cw_next_valid = [c(0, width=1) for _ in range(8)]
    rsp_cw_next_meta = [c(0, width=RSP_META_W) for _ in range(8)]
    rsp_cw_next_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]
    rsp_cc_next_valid = [c(0, width=1) for _ in range(8)]
    rsp_cc_next_meta = [c(0, width=RSP_META_W) for _ in range(8)]
    rsp_cc_next_data = [[c(0, width=WORD_W) for _ in range(DATA_WORDS)] for _ in range(8)]

    for p in range(8):
        stage_v = pipe_stage_valid[p].out()
        stage_is_write = pipe_stage_is_write[p].out()
        stage_src = pipe_stage_src[p].out()
        stage_tag = pipe_stage_tag[p].out()

        route_cw = dir_cw(m, stage_src, p)
        rsp_meta = pack_rsp_meta(m, tag=stage_tag, is_write=stage_is_write, dest=stage_src)

        inject_cw = stage_v & route_cw & (~rsp_cw_fwd_valid[p])
        inject_cc = stage_v & (~route_cw) & (~rsp_cc_fwd_valid[p])

        rsp_cw_next_valid[p] = rsp_cw_fwd_valid[p] | inject_cw
        rsp_cw_next_meta[p] = rsp_cw_fwd_valid[p].select(rsp_cw_fwd_meta[p], rsp_meta)
        for w in range(DATA_WORDS):
            rsp_cw_next_data[p][w] = rsp_cw_fwd_valid[p].select(rsp_cw_fwd_data[p][w], pipe_stage_rdata_words[p][w].out())

        rsp_cc_next_valid[p] = rsp_cc_fwd_valid[p] | inject_cc
        rsp_cc_next_meta[p] = rsp_cc_fwd_valid[p].select(rsp_cc_fwd_meta[p], rsp_meta)
        for w in range(DATA_WORDS):
            rsp_cc_next_data[p][w] = rsp_cc_fwd_valid[p].select(rsp_cc_fwd_data[p][w], pipe_stage_rdata_words[p][w].out())

    for i in range(8):
        rsp_cw_valid[i].set(rsp_cw_next_valid[i])
        rsp_cw_meta[i].set(rsp_cw_next_meta[i])
        for w in range(DATA_WORDS):
            rsp_cw_data[i][w].set(rsp_cw_next_data[i][w])
        rsp_cc_valid[i].set(rsp_cc_next_valid[i])
        rsp_cc_meta[i].set(rsp_cc_next_meta[i])
        for w in range(DATA_WORDS):
            rsp_cc_data[i][w].set(rsp_cc_next_data[i][w])

    # --- MGB output + counts ---
    for i in range(8):
        with m.scope(f"mgb{i}__out"):
            empty = mgb_count[i].out().eq(c(0, width=3))
            arr_cw = rsp_arr_cw[i]
            arr_cc = rsp_arr_cc[i]
            arr_cw_meta = rsp_arr_cw_meta[i]
            arr_cc_meta = rsp_arr_cc_meta[i]
            arr_cw_data = rsp_arr_cw_data[i]
            arr_cc_data = rsp_arr_cc_data[i]

            bypass_cw = arr_cw & (~arr_cc) & rsp_ready[i] & empty
            bypass_cc = arr_cc & (~arr_cw) & rsp_ready[i] & empty
            bypass_any = bypass_cw | bypass_cc

            cw_ready_all = and_all([mgb_cw_meta_q[i].in_ready] + [q.in_ready for q in mgb_cw_data_q[i]])
            cc_ready_all = and_all([mgb_cc_meta_q[i].in_ready] + [q.in_ready for q in mgb_cc_data_q[i]])
            push_cw = arr_cw & (~bypass_cw) & cw_ready_all
            push_cc = arr_cc & (~bypass_cc) & cc_ready_all
            mgb_cw_meta_q[i].push(arr_cw_meta, when=push_cw)
            mgb_cc_meta_q[i].push(arr_cc_meta, when=push_cc)
            for w in range(DATA_WORDS):
                mgb_cw_data_q[i][w].push(arr_cw_data[w], when=push_cw)
                mgb_cc_data_q[i][w].push(arr_cc_data[w], when=push_cc)

            cw_v = and_all([mgb_cw_meta_q[i].out_valid] + [q.out_valid for q in mgb_cw_data_q[i]])
            cc_v = and_all([mgb_cc_meta_q[i].out_valid] + [q.out_valid for q in mgb_cc_data_q[i]])
            rr = mgb_rr[i].out()

            sel_cw = cw_v & (~cc_v | ~rr)
            sel_cc = cc_v & (~cw_v | rr)
            queue_valid = sel_cw | sel_cc
            queue_meta = sel_cw.select(mgb_cw_meta_q[i].out_data, mgb_cc_meta_q[i].out_data)
            queue_data = []
            for w in range(DATA_WORDS):
                queue_data.append(sel_cw.select(mgb_cw_data_q[i][w].out_data, mgb_cc_data_q[i][w].out_data))

            out_valid = bypass_any | queue_valid
            out_meta = bypass_cw.select(arr_cw_meta, bypass_cc.select(arr_cc_meta, queue_meta))
            out_data = []
            for w in range(DATA_WORDS):
                out_data.append(bypass_cw.select(arr_cw_data[w], bypass_cc.select(arr_cc_data[w], queue_data[w])))

            dec = unpack_rsp_meta(out_meta, tag_w=tag_w)

            m.assign(rsp_valid[i], out_valid)
            m.assign(rsp_tag[i], dec["tag"])
            for w in range(DATA_WORDS):
                m.assign(rsp_rdata_words[i][w], out_data[w])

            do_pop = rsp_ready[i] & (~bypass_any) & queue_valid
            mgb_cw_meta_q[i].pop(when=do_pop & sel_cw)
            mgb_cc_meta_q[i].pop(when=do_pop & sel_cc)
            for w in range(DATA_WORDS):
                mgb_cw_data_q[i][w].pop(when=do_pop & sel_cw)
                mgb_cc_data_q[i][w].pop(when=do_pop & sel_cc)

            rr_toggle = do_pop & cw_v & cc_v
            mgb_rr[i].set(rr_toggle.select(~rr, rr))

            cnt = mgb_count[i].out()
            push = push_cw.zext(width=3) + push_cc.zext(width=3)
            pop_dec = do_pop.select(c(7, width=3), c(0, width=3))
            mgb_count[i].set(cnt + push + pop_dec)

    # --- outputs ---
    for i in range(8):
        m.output(f"n{i}_req_ready", req_ready[i])
        m.output(f"n{i}_rsp_valid", rsp_valid[i])
        m.output(f"n{i}_rsp_tag", rsp_tag[i])
        for w in range(DATA_WORDS):
            m.output(f"n{i}_rsp_rdata_w{w}", rsp_rdata_words[i][w])


# Wrapper kept tiny so the AST/JIT compiler executes the implementation as Python.
def build(
    m: Circuit,
    *,
    tile_bytes: int = (1 << 20),
    tag_w: int | None = None,
    addr_w: int = 20,
    idx_w: int | None = None,
) -> None:
    _build_tmu(m, tile_bytes=tile_bytes, tag_w=tag_w, addr_w=addr_w, idx_w=idx_w)


build.__pycircuit_name__ = "janus_tmu_pyc"
