#!/bin/bash

echo "Installing Frama-C..."

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

docker pull framac/frama-c-gui:dev

if [ $? -eq 0 ]; then
    echo "Frama-C successfully installed."
else
    echo "Failed to install Frama-C."
fi