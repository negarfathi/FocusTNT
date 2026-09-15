#!/bin/bash

root_directory="$(cd "$(dirname "$0")" && pwd)"
benchmarks_directory="$root_directory/Benchmarks"
results_directory="$root_directory/ReproducedResults"
tool_directory="$root_directory/cmake-build-debug/FocusTNT"

modes=("base" "slice" "cncrt" "slice+cncrt" "cncrt+slice")

rm -rf "$results_directory"
cp -r "$benchmarks_directory" "$results_directory"

mkdir -p "$results_directory/base"

for item in "$results_directory"/*; do
    if [[ "$(basename "$item")" != "base" ]]; then
        mv "$item" "$results_directory/base/" 2>/dev/null
    fi
done

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

        find "$results_directory/$tool/$mode" -type f \( -name "*.c" -o -name "*.cpp" \) | sort | while read -r source_code; do
            echo "Running: $source_code"

            source_directory="$(dirname "$source_code")"
            test_cases="$source_directory/test_cases.csv"
            ground_truth="$source_directory/ground_truth.csv"

            "$tool_directory" \
                --analysis \
                "$source_code" \
                "$test_cases" \
                "$ground_truth" \
                --tool="$tool" \
                --benchmark=FSE \
                --configuration="$configuration" \
                --timeout=300

            sleep 5
            docker container prune -f
        done

    done
done
