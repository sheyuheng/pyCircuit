from __future__ import annotations

from dataclasses import dataclass
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from pycircuit import Circuit


def and_all(wires: list["Wire"]) -> "Wire":
    out = wires[0]
    for w in wires[1:]:
        out = out & w
    return out


@dataclass(frozen=True)
class Spb:
    count: "Wire"
    cw_meta_q: "Queue"
    cc_meta_q: "Queue"
    cw_data_q: list["Queue"]
    cc_data_q: list["Queue"]
    cw_strb_q: list["Queue"]
    cc_strb_q: list["Queue"]
    push_fire: "Wire"


@dataclass(frozen=True)
class Mgb:
    count: "Wire"
    rr: "Wire"
    cw_meta_q: "Queue"
    cc_meta_q: "Queue"
    cw_data_q: list["Queue"]
    cc_data_q: list["Queue"]


def build_spb(
    m: "Circuit",
    *,
    idx: int,
    clk: "Wire",
    rst: "Wire",
    req_meta_w: int,
    data_words: int,
    word_w: int,
    strb_w: int,
    depth: int = 4,
) -> Spb:
    c = m.const_wire
    with m.scope(f"spb{idx}"):
        count = m.out("count", clk=clk, rst=rst, width=3, init=c(0, width=3))
        cw_meta_q = m.queue(f"spb{idx}__cw_meta", clk=clk, rst=rst, width=req_meta_w, depth=depth)
        cc_meta_q = m.queue(f"spb{idx}__cc_meta", clk=clk, rst=rst, width=req_meta_w, depth=depth)
        cw_data_q = [m.queue(f"spb{idx}__cw_d{w}", clk=clk, rst=rst, width=word_w, depth=depth) for w in range(data_words)]
        cc_data_q = [m.queue(f"spb{idx}__cc_d{w}", clk=clk, rst=rst, width=word_w, depth=depth) for w in range(data_words)]
        cw_strb_q = [m.queue(f"spb{idx}__cw_s{w}", clk=clk, rst=rst, width=strb_w, depth=depth) for w in range(data_words)]
        cc_strb_q = [m.queue(f"spb{idx}__cc_s{w}", clk=clk, rst=rst, width=strb_w, depth=depth) for w in range(data_words)]
        push_fire = m.named_wire("push_fire", width=1)
    return Spb(
        count=count,
        cw_meta_q=cw_meta_q,
        cc_meta_q=cc_meta_q,
        cw_data_q=cw_data_q,
        cc_data_q=cc_data_q,
        cw_strb_q=cw_strb_q,
        cc_strb_q=cc_strb_q,
        push_fire=push_fire,
    )


def build_mgb(
    m: "Circuit",
    *,
    idx: int,
    clk: "Wire",
    rst: "Wire",
    rsp_meta_w: int,
    data_words: int,
    word_w: int,
    depth: int = 4,
) -> Mgb:
    c = m.const_wire
    with m.scope(f"mgb{idx}"):
        count = m.out("count", clk=clk, rst=rst, width=3, init=c(0, width=3))
        rr = m.out("rr", clk=clk, rst=rst, width=1, init=c(0, width=1))
        cw_meta_q = m.queue(f"mgb{idx}__cw_meta", clk=clk, rst=rst, width=rsp_meta_w, depth=depth)
        cc_meta_q = m.queue(f"mgb{idx}__cc_meta", clk=clk, rst=rst, width=rsp_meta_w, depth=depth)
        cw_data_q = [m.queue(f"mgb{idx}__cw_d{w}", clk=clk, rst=rst, width=word_w, depth=depth) for w in range(data_words)]
        cc_data_q = [m.queue(f"mgb{idx}__cc_d{w}", clk=clk, rst=rst, width=word_w, depth=depth) for w in range(data_words)]
    return Mgb(
        count=count,
        rr=rr,
        cw_meta_q=cw_meta_q,
        cc_meta_q=cc_meta_q,
        cw_data_q=cw_data_q,
        cc_data_q=cc_data_q,
    )
