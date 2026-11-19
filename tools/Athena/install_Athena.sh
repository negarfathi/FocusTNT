#!/usr/bin/env bash
set -Eeuo pipefail

echo "Installing Athena (CoAR / TermCOMP)..."

script_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_directory="$script_directory/coar"

if [[ ! -d "$source_directory" ]]; then
    git clone --depth 1 https://github.com/hiroshi-unno/coar.git "$source_directory"
fi

git -C "$source_directory" submodule update --init --recursive -- athena/llvm2kittel

cd "$source_directory"

docker buildx build \
    --platform linux/amd64 \
    --progress=plain \
    -f Dockerfile \
    -t coar:latest \
    --load .

docker buildx build \
    --platform linux/amd64 \
    --progress=plain \
    -f script/termcomp/Dockerfile \
    -t termcomp:latest \
    --load .

echo "Athena Docker images built successfully."