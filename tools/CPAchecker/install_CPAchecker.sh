#!/bin/bash

echo "Installing CPAchecker..."

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

docker pull sosylab/cpachecker:dev

if [ $? -eq 0 ]; then
    echo "CPAchecker successfully installed."
else
    echo "Failed to install CPAchecker."
fi