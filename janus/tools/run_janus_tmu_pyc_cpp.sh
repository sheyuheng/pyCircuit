#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "${SCRIPT_DIR}/../.." && pwd)"
# shellcheck source=../../scripts/lib.sh
source "${ROOT_DIR}/scripts/lib.sh"
pyc_find_pyc_compile

GEN_DIR="${ROOT_DIR}/janus/generated/janus_tmu_pyc"
HDR="${GEN_DIR}/janus_tmu_pyc_gen.hpp"
if [[ ! -f "${HDR}" ]]; then
  mkdir -p "${GEN_DIR}"
  TMP_PYC="$(mktemp -t "pycircuit.janus.janus_tmu_pyc.pyc.XXXXXX")"
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="$(pyc_pythonpath):${ROOT_DIR}/janus/pyc" \
    python3 -m pycircuit.cli emit "${ROOT_DIR}/janus/pyc/janus/tmu/janus_tmu_pyc.py" -o "${TMP_PYC}"
  "${PYC_COMPILE}" "${TMP_PYC}" --emit=cpp -o "${GEN_DIR}/janus_tmu_pyc.hpp"
  rm -f "${TMP_PYC}"
  mv -f "${GEN_DIR}/janus_tmu_pyc.hpp" "${HDR}"
fi

WORK_DIR="$(mktemp -d -t janus_tmu_pyc_tb.XXXXXX)"
trap 'rm -rf "${WORK_DIR}"' EXIT

CXX_BIN="${CXX:-}"
if [[ -z "${CXX_BIN}" ]]; then
  if command -v clang++ >/dev/null 2>&1; then
    CXX_BIN=clang++
  else
    CXX_BIN=g++
  fi
fi

"${CXX_BIN}" -std=c++17 -O0 -g0 \
  -I "${ROOT_DIR}/include" \
  -I "${GEN_DIR}" \
  -o "${WORK_DIR}/tb_janus_tmu_pyc" \
  "${ROOT_DIR}/janus/tb/tb_janus_tmu_pyc.cpp"

if [[ $# -gt 0 ]]; then
  "${WORK_DIR}/tb_janus_tmu_pyc" "$@"
else
  "${WORK_DIR}/tb_janus_tmu_pyc"
fi
