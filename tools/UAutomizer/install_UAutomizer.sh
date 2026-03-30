#!/bin/bash

echo "Installing UAutomizer..."

if ! command -v curl &> /dev/null; then
    echo "Curl is not installed. Please install curl first."
    exit 1
fi

if ! command -v unzip &> /dev/null; then
    echo "Unzip is not installed. Please install unzip first."
    exit 1
fi

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if cd "$SCRIPT_DIR" && \
   rm -f UltimateAutomizer-linux.zip && \
   rm -rf UltimateAutomizer && \
   curl -L -o UltimateAutomizer-linux.zip https://github.com/ultimate-pa/ultimate/releases/download/v0.2.2/UltimateAutomizer-linux.zip && \
   unzip -q UltimateAutomizer-linux.zip && \
   docker build -t uautomizer .
then
    echo "UAutomizer successfully installed."
else
    echo "Failed to install UAutomizer."
fi