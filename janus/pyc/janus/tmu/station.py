from __future__ import annotations

from dataclasses import dataclass
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from pycircuit import Circuit

RING_ORDER = [0, 1, 3, 5, 7, 6, 4, 2]
POS = {n: i for i, n in enumerate(RING_ORDER)}
CW_NEXT = {n: RING_ORDER[(POS[n] + 1) % 8] for n in RING_ORDER}
CC_NEXT = {n: RING_ORDER[(POS[n] - 1) % 8] for n in RING_ORDER}

CW_PREF = [[False for _ in range(8)] for _ in range(8)]
for s in range(8):
    for d in range(8):
        cw_dist = (POS[d] - POS[s]) % 8
        cc_dist = (POS[s] - POS[d]) % 8
        CW_PREF[s][d] = cw_dist <= cc_dist


def dir_cw(m: "Circuit", dest: "Wire", src_node: int) -> "Wire":
    c = m.const_wire
    out = c(1 if CW_PREF[src_node][0] else 0, width=1)
    for d in range(1, 8):
        out = dest.eq(c(d, width=3)).select(c(1 if CW_PREF[src_node][d] else 0, width=1), out)
    return out


@dataclass(frozen=True)
class ReqRingStation:
    cw_valid: "Wire"
    cw_meta: "Wire"
    cw_data: list["Wire"]
    cw_strb: list["Wire"]
    cc_valid: "Wire"
    cc_meta: "Wire"
    cc_data: list["Wire"]
    cc_strb: list["Wire"]


@dataclass(frozen=True)
class RspRingStation:
    cw_valid: "Wire"
    cw_meta: "Wire"
    cw_data: list["Wire"]
    cc_valid: "Wire"
    cc_meta: "Wire"
    cc_data: list["Wire"]


@dataclass(frozen=True)
class PipeState:
    rr: "Wire"
    stage_valid: "Wire"
    stage_is_write: "Wire"
    stage_src: "Wire"
    stage_tag: "Wire"
    stage_rdata_words: list["Wire"]


def build_req_ring(
    m: "Circuit",
    *,
    clk: "Wire",
    rst: "Wire",
    meta_w: int,
    data_words: int,
    word_w: int,
    strb_w: int,
) -> list[ReqRingStation]:
    c = m.const_wire
    stations: list[ReqRingStation] = []
    for i in range(8):
        with m.scope(f"req_ring{i}"):
            cw_valid = m.out("cw_valid", clk=clk, rst=rst, width=1, init=c(0, width=1))
            cw_meta = m.out("cw_meta", clk=clk, rst=rst, width=meta_w, init=c(0, width=meta_w))
            cw_data = [m.out(f"cw_data{w}", clk=clk, rst=rst, width=word_w, init=c(0, width=word_w)) for w in range(data_words)]
            cw_strb = [m.out(f"cw_strb{w}", clk=clk, rst=rst, width=strb_w, init=c(0, width=strb_w)) for w in range(data_words)]
            cc_valid = m.out("cc_valid", clk=clk, rst=rst, width=1, init=c(0, width=1))
            cc_meta = m.out("cc_meta", clk=clk, rst=rst, width=meta_w, init=c(0, width=meta_w))
            cc_data = [m.out(f"cc_data{w}", clk=clk, rst=rst, width=word_w, init=c(0, width=word_w)) for w in range(data_words)]
            cc_strb = [m.out(f"cc_strb{w}", clk=clk, rst=rst, width=strb_w, init=c(0, width=strb_w)) for w in range(data_words)]
        stations.append(
            ReqRingStation(
                cw_valid=cw_valid,
                cw_meta=cw_meta,
                cw_data=cw_data,
                cw_strb=cw_strb,
                cc_valid=cc_valid,
                cc_meta=cc_meta,
                cc_data=cc_data,
                cc_strb=cc_strb,
            )
        )
    return stations


def build_rsp_ring(
    m: "Circuit",
    *,
    clk: "Wire",
    rst: "Wire",
    meta_w: int,
    data_words: int,
    word_w: int,
) -> list[RspRingStation]:
    c = m.const_wire
    stations: list[RspRingStation] = []
    for i in range(8):
        with m.scope(f"rsp_ring{i}"):
            cw_valid = m.out("cw_valid", clk=clk, rst=rst, width=1, init=c(0, width=1))
            cw_meta = m.out("cw_meta", clk=clk, rst=rst, width=meta_w, init=c(0, width=meta_w))
            cw_data = [m.out(f"cw_data{w}", clk=clk, rst=rst, width=word_w, init=c(0, width=word_w)) for w in range(data_words)]
            cc_valid = m.out("cc_valid", clk=clk, rst=rst, width=1, init=c(0, width=1))
            cc_meta = m.out("cc_meta", clk=clk, rst=rst, width=meta_w, init=c(0, width=meta_w))
            cc_data = [m.out(f"cc_data{w}", clk=clk, rst=rst, width=word_w, init=c(0, width=word_w)) for w in range(data_words)]
        stations.append(
            RspRingStation(
                cw_valid=cw_valid,
                cw_meta=cw_meta,
                cw_data=cw_data,
                cc_valid=cc_valid,
                cc_meta=cc_meta,
                cc_data=cc_data,
            )
        )
    return stations


def build_pipe_state(
    m: "Circuit",
    *,
    pipe: int,
    clk: "Wire",
    rst: "Wire",
    tag_w: int,
    data_words: int,
    word_w: int,
) -> PipeState:
    c = m.const_wire
    with m.scope(f"pipe{pipe}__state"):
        rr = m.out("rr", clk=clk, rst=rst, width=1, init=c(0, width=1))
        stage_valid = m.out("stage_v", clk=clk, rst=rst, width=1, init=c(0, width=1))
        stage_is_write = m.out("stage_w", clk=clk, rst=rst, width=1, init=c(0, width=1))
        stage_src = m.out("stage_src", clk=clk, rst=rst, width=3, init=c(0, width=3))
        stage_tag = m.out("stage_tag", clk=clk, rst=rst, width=tag_w, init=c(0, width=tag_w))
        stage_rdata_words = [
            m.out(f"stage_rdata{w}", clk=clk, rst=rst, width=word_w, init=c(0, width=word_w))
            for w in range(data_words)
        ]
    return PipeState(
        rr=rr,
        stage_valid=stage_valid,
        stage_is_write=stage_is_write,
        stage_src=stage_src,
        stage_tag=stage_tag,
        stage_rdata_words=stage_rdata_words,
    )
