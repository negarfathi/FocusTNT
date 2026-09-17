#!/bin/bash

set -Eeuo pipefail

root_directory="$(cd "$(dirname "$0")" && pwd)"
benchmarks_directory="$root_directory/Benchmarks"
tool_directory="$root_directory/cmake-build-debug/FocusTNT"
venv_directory="$root_directory/.venv"
model_directory="$root_directory/models/gpt-oss-20b"

model="gpt-oss-20b"
temperature="1"
reasoning_effort="medium"
max_attempts=10
num_inputs=4
execution_timeout=60

host="127.0.0.1"
port=8000
server_log="$root_directory/vllm.log"

if [[ ! -x "$tool_directory" ]]; then
    echo "FocusTNT executable not found: $tool_directory"
    exit 1
fi

if [[ ! -x "$venv_directory/bin/vllm" ]]; then
    echo "vLLM not found: $venv_directory/bin/vllm"
    exit 1
fi

if [[ ! -f "$model_directory/config.json" ]]; then
    echo "Model not found: $model_directory"
    exit 1
fi

if curl -sf "http://$host:$port/v1/models" >/dev/null 2>&1; then
    echo "A vLLM server is already running on $host:$port."
    exit 1
fi

echo "Starting vLLM..."

VLLM_USE_FLASHINFER_SAMPLER=0 \
"$venv_directory/bin/vllm" serve "$model_directory" \
    --served-model-name "$model" \
    --host "$host" \
    --port "$port" \
    --reasoning-parser openai_gptoss \
    > "$server_log" 2>&1 &

vllm_pid=$!

cleanup() {
    if kill -0 "$vllm_pid" 2>/dev/null; then
        echo "Stopping vLLM..."
        kill "$vllm_pid"
        wait "$vllm_pid" 2>/dev/null || true
    fi
}

trap cleanup EXIT INT TERM

echo "Waiting for vLLM..."

for ((i = 0; i < 180; i++)); do
    if curl -sf "http://$host:$port/v1/models" >/dev/null 2>&1; then
        echo "vLLM is ready."
        break
    fi

    if ! kill -0 "$vllm_pid" 2>/dev/null; then
        echo "vLLM failed to start."
        echo "See: $server_log"
        exit 1
    fi

    sleep 5
done

if ! curl -sf "http://$host:$port/v1/models" >/dev/null 2>&1; then
    echo "Timed out waiting for vLLM."
    echo "See: $server_log"
    exit 1
fi

find "$benchmarks_directory" -type f \( -name "*_T.c" -o -name "*_NT.c" -o -name "*_T.cpp" -o -name "*_NT.cpp" \) | sort | while read -r source_code; do
    echo "Generating inputs: $source_code"

    VLLM_BASE_URL="http://$host:$port" \
        "$tool_directory" \
            --input-generation \
            "$source_code" \
            --model="$model" \
            --temperature="$temperature" \
            --reasoning-effort="$reasoning_effort" \
            --max-attempts="$max_attempts" \
            --num-inputs="$num_inputs" \
            --execution-timeout="$execution_timeout"
done
