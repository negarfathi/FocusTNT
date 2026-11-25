#!/bin/bash

set -Eeuo pipefail

root_directory="$(cd "$(dirname "$0")" && pwd)"

if (( $# > 2 )); then
    echo "Usage: $0 [slice-dataset-directory] [FocusTNT-executable]" >&2
    exit 1
fi

benchmark_directory="${1:-$root_directory/results_Analysis/2LS/slice}"
if [[ $# -eq 0 && ! -d "$benchmark_directory" ]]; then
    benchmark_directory="$root_directory/results/results_Analysis/2LS/slice"
fi

tool_directory="${2:-$root_directory/cmake-build-debug/FocusTNT}"
if [[ $# -lt 2 && ! -x "$tool_directory" ]]; then
    tool_directory="$root_directory/build/FocusTNT"
fi

if [[ ! -x "$tool_directory" || ! -f "$tool_directory" ]]; then
    echo "FocusTNT executable not found: $tool_directory" >&2
    exit 1
fi

if [[ ! -d "$benchmark_directory" ]]; then
    echo "Sliced benchmark directory not found: $benchmark_directory" >&2
    echo "Run analysis first or pass an existing slice dataset directory." >&2
    exit 1
fi

benchmark_directory="$(cd "$benchmark_directory" && pwd)"
echo "Running slicing validation: $benchmark_directory"
"$tool_directory" --slicing-validation "$benchmark_directory"
