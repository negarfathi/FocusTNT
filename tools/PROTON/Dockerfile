FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TOOL_ROOT=/opt/term/proton
WORKDIR ${TOOL_ROOT}

RUN dpkg --add-architecture i386 \
 && apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl wget git unzip \
    gnupg dirmngr \
    gcc g++-12 clang-14 llvm-14 \
    libc6-dev-i386 \
    libz3-4 libz3-dev \
    python3 python3-pip python3-venv python3-dev \
    build-essential cmake pkg-config \
 && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 120 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 120 \
 && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-14 120

ENV PATH="${TOOL_ROOT}/bin:${PATH}"

COPY term/proton/ ${TOOL_ROOT}/
COPY termination.prp ${TOOL_ROOT}/termination.prp

RUN chmod +x proton bracer/bracer cbmc/cbmc run-*.sh || true \
 && mkdir -p logs tmp

RUN python3 - <<'PY'
p="/opt/term/proton/virtualenv_tools.py"
future="from __future__ import annotations\n"
txt=open(p,"r",encoding="utf-8").read().replace(future,"")
open(p,"w",encoding="utf-8").write(future + txt)
PY

RUN python3 -m venv /opt/term/proton/venv \
 && /opt/term/proton/venv/bin/pip install --upgrade pip \
 && /opt/term/proton/venv/bin/pip install llama-cpp-python tqdm numpy

RUN cat > /opt/term/proton/llm-t-check.sh <<'SH' \
 && chmod +x /opt/term/proton/llm-t-check.sh
#!/usr/bin/env bash
set -euo pipefail
TOOL_DIR="${TOOL_DIR:-/opt/term/proton}"
BM_DIR="${BM_DIR:-$PWD}"
LLM_GGUF="${LLM_GGUF:-Llama-iproton.gguf}"
cd "$TOOL_DIR"
if [ $# -lt 1 ]; then
  echo "Usage: llm-t-check.sh <file.c>" >&2
  exit 2
fi
if [ ! -f "$BM_DIR/$1" ]; then
  echo "Input not found: $BM_DIR/$1" >&2
  exit 2
fi
source /opt/term/proton/venv/bin/activate
python3 check_ter.py --in-file "$BM_DIR/$1" --gguf "$LLM_GGUF"
SH

CMD ["/bin/bash"]