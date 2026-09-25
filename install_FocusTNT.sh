#!/bin/bash

set -Eeuo pipefail

root_directory="$(cd "$(dirname "$0")" && pwd)"
venv_directory="$root_directory/.venv"
models_directory="$root_directory/models"
gpt_oss_directory="$models_directory/gpt-oss-20b"

vllm_version="0.28.0"
vllm_wheel="https://github.com/vllm-project/vllm/releases/download/v0.28.0/vllm-0.28.0%2Bcu129-cp38-abi3-manylinux_2_28_x86_64.whl"
pytorch_index="https://download.pytorch.org/whl/cu129"
gpt_oss_repo="openai/gpt-oss-20b"

if ! command -v cmake &> /dev/null; then
    echo "CMake is not installed. Please install CMake first."
    exit 1
fi

if ! command -v make &> /dev/null; then
    echo "Make is not installed. Please install make first."
    exit 1
fi

echo "Installing FocusTNT's tool dependencies..."

"$root_directory/tools/XLNT/install_xlnt.sh"
"$root_directory/tools/FramaC/install_FramaC.sh"

 if cd "$root_directory/tools" && \
    rm -rf Athena && \
    git clone https://github.com/negarfarhi/Athena.git; then
     "$root_directory/tools/Athena/install_Athena.sh"
 else
     echo "Failed to clone Athena."
     exit 1
 fi

 "$root_directory/tools/PROTON/install_PROTON.sh"
 "$root_directory/tools/UAutomizer/install_UAutomizer.sh"
 "$root_directory/tools/AProVE/install_AProVE.sh"
 "$root_directory/tools/CPAchecker/install_CPAchecker.sh"
 "$root_directory/tools/2LS/install_2LS.sh"

echo "All FocusTNT's tool dependencies successfully installed."

echo "Installing FocusTNT..."

mkdir -p "$root_directory/cmake-build-debug"
cd "$root_directory/cmake-build-debug"
cmake ..
make -j

if [[ ! -x "$root_directory/cmake-build-debug/FocusTNT" ]]; then
    echo "Failed to install FocusTNT."
    exit 1
fi

echo "FocusTNT successfully installed."

if ! command -v uv >/dev/null 2>&1; then
    if [[ -x "$HOME/.local/bin/uv" ]]; then
        export PATH="$HOME/.local/bin:$PATH"
    else
        echo "Installing uv..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
        export PATH="$HOME/.local/bin:$PATH"
    fi
fi

if [[ ! -d "$venv_directory" ]]; then
    echo "Creating Python virtual environment..."
    uv venv \
        --python 3.12 \
        --seed \
        --managed-python \
        "$venv_directory"
fi

source "$venv_directory/bin/activate"

if python - <<PY >/dev/null 2>&1
import vllm
raise SystemExit(0 if vllm.__version__ == "$vllm_version" else 1)
PY
then
    echo "vLLM $vllm_version already installed."
else
    echo "Installing vLLM $vllm_version..."
    uv pip install \
        "$vllm_wheel" \
        --extra-index-url "$pytorch_index" \
        --index-strategy unsafe-best-match
fi

echo "Checking PyTorch, CUDA, and vLLM..."

python - <<'PY'
import torch
import vllm

print("Torch:", torch.__version__)
print("CUDA:", torch.version.cuda)
print("GPU available:", torch.cuda.is_available())
print("vLLM:", vllm.__version__)

if not torch.cuda.is_available():
    raise SystemExit("ERROR: CUDA GPU is not available to PyTorch.")
PY

mkdir -p "$models_directory"

if [[ ! -f "$gpt_oss_directory/config.json" ]]; then
    echo "Downloading gpt-oss-20b..."

    model_repo="$gpt_oss_repo" \
    model_destination="$gpt_oss_directory" \
    python - <<'PY'
import os
from huggingface_hub import snapshot_download

snapshot_download(
    repo_id=os.environ["model_repo"],
    local_dir=os.environ["model_destination"],
    token=os.environ.get("HF_TOKEN") or None,
)
PY
else
    echo "gpt-oss-20b already downloaded."
fi

echo
echo "FocusTNT installation complete."
echo "Executable: $root_directory/cmake-build-debug/FocusTNT"
echo "vLLM environment: $venv_directory"
echo "Model: $gpt_oss_directory"

cd "$root_directory"
