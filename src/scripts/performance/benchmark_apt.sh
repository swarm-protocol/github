#!/usr/bin/env bash

# Performance benchmark for APT installation strategies
# Compares sequential vs batched installation using dry-runs.

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$REPO_ROOT"

envs=("common" "test" "docker" "documentation" "code-review" "refactoring" "wrangler" "terraform" "ansible" "security")

echo "⚡ Bolt Performance Benchmark: APT Installation"
echo "=============================================="

# Check if apt-get is available
if ! command -v apt-get &> /dev/null; then
    echo "❌ Error: apt-get not found. This script requires a Debian-based system."
    exit 1
fi

echo "--- 1. Sequential Simulation (Dry-run) ---"
start_seq=$(date +%s%3N)
for env in "${envs[@]}"; do
    pkg_file="apt/$env/packages.txt"
    if [ -f "$pkg_file" ]; then
        pkgs=$(sed 's/#.*//' "$pkg_file" | xargs)
        if [ -n "$pkgs" ]; then
            printf "Processing %-15s ... " "$env"
            if apt-get install -s -o Debug::NoLocking=1 $pkgs > /dev/null 2>&1; then
                echo "OK"
            else
                echo "FAILED"
            fi
        fi
    fi
done
end_seq=$(date +%s%3N)
seq_time=$((end_seq - start_seq))
echo "Sequential Total Time: ${seq_time}ms"
echo

echo "--- 2. Batched Simulation (Dry-run) ---"
start_batch=$(date +%s%3N)
all_packages=""
printf "Collecting packages ... "
for env in "${envs[@]}"; do
    pkg_file="apt/$env/packages.txt"
    if [ -f "$pkg_file" ]; then
        all_packages+="$(sed 's/#.*//' "$pkg_file") "
    fi
done
unique_packages=$(echo "$all_packages" | tr ' ' '\n' | grep -v '^$' | sort -u | xargs)
echo "Done ($(echo "$unique_packages" | wc -w) unique packages)"

printf "Executing batch install ... "
if [ -n "$unique_packages" ]; then
    if apt-get install -s -o Debug::NoLocking=1 $unique_packages > /dev/null 2>&1; then
        echo "OK"
    else
        echo "FAILED"
    fi
fi
end_batch=$(date +%s%3N)
batch_time=$((end_batch - start_batch))
echo "Batched Total Time: ${batch_time}ms"
echo

echo "--- Summary ---"
if command -v awk &> /dev/null; then
    improvement=$(awk "BEGIN {print ($seq_time - $batch_time) / $seq_time * 100}")
    printf "⚡ Performance Improvement: %.2f%%\n" "$improvement"
    printf "⏱️  Time Saved: %dms\n" "$((seq_time - batch_time))"
else
    echo "Sequential: ${seq_time}ms"
    echo "Batched:    ${batch_time}ms"
fi
echo "=============================================="
