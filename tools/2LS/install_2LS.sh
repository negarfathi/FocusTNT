#!/bin/bash

echo "Installing 2LS..."

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git first."
    exit 1
fi

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if cd "$SCRIPT_DIR" && \
   rm -rf 2ls && \
   git clone --recursive https://github.com/diffblue/2ls.git && \
   docker build -t 2ls .
then
    echo "2LS successfully installed."
else
    echo "Failed to install 2LS."
fi