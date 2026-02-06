from __future__ import annotations

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from pycircuit import Circuit


def pack_req_meta(m: "Circuit", *, tag: "Wire", is_write: "Wire", src: "Wire") -> "Wire":
    # LSB..MSB: src | is_write | tag
    return m.cat(tag, is_write, src)


def unpack_req_meta(meta: "Wire", *, tag_w: int) -> dict[str, "Wire"]:
    lsb = 0
    src = meta.slice(lsb=lsb, width=3)
    lsb += 3
    is_write = meta.slice(lsb=lsb, width=1)
    lsb += 1
    tag = meta.slice(lsb=lsb, width=tag_w)
    return {"src": src, "is_write": is_write, "tag": tag}


def pack_rsp_meta(m: "Circuit", *, tag: "Wire", is_write: "Wire", dest: "Wire") -> "Wire":
    # LSB..MSB: dest | is_write | tag
    return m.cat(tag, is_write, dest)


def unpack_rsp_meta(meta: "Wire", *, tag_w: int) -> dict[str, "Wire"]:
    lsb = 0
    dest = meta.slice(lsb=lsb, width=3)
    lsb += 3
    is_write = meta.slice(lsb=lsb, width=1)
    lsb += 1
    tag = meta.slice(lsb=lsb, width=tag_w)
    return {"dest": dest, "is_write": is_write, "tag": tag}
