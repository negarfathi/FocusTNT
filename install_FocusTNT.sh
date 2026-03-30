#!/bin/bash

if ! command -v cmake &> /dev/null; then
    echo "CMake is not installed. Please install CMake first."
    exit 1
fi

if ! command -v make &> /dev/null; then
    echo "Make is not installed. Please install make first."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing FocusTNT's tool dependencies..."

$SCRIPT_DIR/tools/XLNT/install_xlnt.sh
$SCRIPT_DIR/tools/FramaC/install_FramaC.sh
if cd "$SCRIPT_DIR/tools" && \
   rm -rf Athena && \
   git clone https://github.com/negarfarhi/Athena.git && \
then
    $SCRIPT_DIR/tools/Athena/install_Athena.sh
else
    echo "Failed to clone Atena."
fi
$SCRIPT_DIR/tools/PROTON/install_PROTON.sh
$SCRIPT_DIR/tools/UAutomizer/install_UAutomizer.sh
$SCRIPT_DIR/tools/AProVE/install_AProVE.sh
$SCRIPT_DIR/tools/CPAchecker/install_CPAchecker.sh
$SCRIPT_DIR/tools/2LS/install_2LS.sh

echo "All FocusTNT's tool dependencies successfully installed."

echo "Installing FocusTNT..."

if mkdir -p "$SCRIPT_DIR/cmake-build-debug" && \
   cd "$SCRIPT_DIR/cmake-build-debug" && \
   cmake .. && \
   make -j
then
    echo "FocusTNT successfully installed."
else
    echo "Failed to install FocusTNT."
fi

cd "$SCRIPT_DIR"