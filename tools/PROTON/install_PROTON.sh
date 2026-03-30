#!/bin/bash

echo "Installing Proton..."

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
   rm -rf term && \
   git clone https://github.com/kumarmadhukar/term.git && \
   docker buildx build --platform=linux/amd64 -t proton --load .
then
    echo "Proton successfully installed."
else
    echo "Failed to install Proton."
fi