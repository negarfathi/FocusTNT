#!/bin/bash

set -Eeuo pipefail

root_directory="$(cd "$(dirname "$0")" && pwd)"
benchmark_directory="$root_directory/results/results_InputGeneration"
results_directory="$root_directory/results_Analysis"
tool_directory="$root_directory/cmake-build-debug/FocusTNT"
ground_truth="$root_directory/ground_truth.csv"

if [[ ! -x "$tool_directory" ]]; then
    echo "FocusTNT executable not found: $tool_directory"
    exit 1
fi

if [[ ! -d "$benchmark_directory" ]]; then
    echo "Input generation results directory not found: $benchmark_directory"
    exit 1
fi

if [[ ! -f "$ground_truth" ]]; then
    echo "Ground truth file not found: $ground_truth"
    exit 1
fi

rm -rf "$results_directory"
mkdir -p "$results_directory/base"
find "$benchmark_directory" \
    -type d -name "input_generator_artifacts" -prune -o \
    -type f \( -name "*.c" -o -name "*.cpp" -o -name "test_cases.csv" \) -print | while read -r source_file; do
    relative_path="${source_file#"$benchmark_directory"/}"
    destination="$results_directory/base/$relative_path"
    mkdir -p "$(dirname "$destination")"
    cp "$source_file" "$destination"
done

modes=("base" "slice" "cncrt" "slice+cncrt" "cncrt+slice")
for mode in "${modes[@]}"; do
    if [[ "$mode" != "base" ]]; then
        cp -r "$results_directory/base" "$results_directory/$mode"
    fi
done

tools=("Athena" "PROTON" "UAutomizer" "AProVE" "CPAchecker" "2LS")
for tool in "${tools[@]}"; do
    mkdir -p "$results_directory/$tool"
    for mode in "${modes[@]}"; do
        cp -r "$results_directory/$mode" "$results_directory/$tool/"
    done
done

for mode in "${modes[@]}"; do
    rm -rf "$results_directory/$mode"
done

for tool in "${tools[@]}"; do
    for mode in "${modes[@]}"; do
        if [[ "$mode" == "base" ]]; then
            configuration="base"
        elif [[ "$mode" == "slice" ]]; then
            configuration="slice"
        elif [[ "$mode" == "cncrt" ]]; then
            configuration="cncrt"
        elif [[ "$mode" == "slice+cncrt" ]]; then
            configuration="slice_cncrt"
        elif [[ "$mode" == "cncrt+slice" ]]; then
            configuration="cncrt_slice"
        else
            continue
        fi

        find "$results_directory/$tool/$mode" -type f \( -name "*_T.c" -o -name "*_NT.c" -o -name "*_T.cpp" -o -name "*_NT.cpp" \) | sort | while read -r source_code; do
            echo "Running: $source_code"

            source_directory="$(dirname "$source_code")"
            test_cases="$source_directory/test_cases.csv"

            "$tool_directory" \
                --analysis \
                "$source_code" \
                "$test_cases" \
                "$ground_truth" \
                --tool="$tool" \
                --benchmark=FSE \
                --configuration="$configuration" \
                --timeout=300 || true

            docker container prune -f || true
        done
    done
done