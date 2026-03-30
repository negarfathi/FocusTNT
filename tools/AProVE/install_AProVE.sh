#!/bin/bash

echo "Installing AProVE..."

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

docker pull nlommen/aprove_koat_loat:578822

if [ $? -eq 0 ]; then
    echo "AProVE successfully installed."
else
    echo "Failed to install AProVE."
fi