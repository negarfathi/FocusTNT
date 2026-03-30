#!/bin/bash

echo "Installing xlnt..."

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git first."
    exit 1
fi

if ! command -v cmake &> /dev/null; then
    echo "CMake is not installed. Please install CMake first."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if cd "$SCRIPT_DIR" && \
   rm -rf xlnt && \
   git clone https://github.com/xlnt-community/xlnt.git xlnt --recurse-submodules && \
   cd xlnt && \
   mkdir -p build && \
   cd build && \
   cmake .. && \
   cmake --build . -j4
then
    echo "xlnt successfully installed."
else
    echo "Failed to install xlnt."
fi