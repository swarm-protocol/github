# Performance and Connectivity Testing Scripts

This directory contains scripts for measuring the performance of repository workflows and the connectivity of the development environment.

## Available Scripts

### 1. `benchmark_apt.sh`

This script benchmarks the performance of APT package installations. It compares the sequential installation strategy (installing environments one by one) against the batched strategy (installing all unique packages in a single call).

**Usage:**
```bash
bash src/scripts/performance/benchmark_apt.sh
```

**What it measures:**
- Total execution time for sequential dry-runs.
- Total execution time for a single batched dry-run.
- Percentage improvement and time saved.

### 2. `check_connectivity.sh`

This script measures the network latency to critical infrastructure endpoints used by the repository's bootstrap and development processes.

**Usage:**
```bash
bash src/scripts/performance/check_connectivity.sh
```

**What it measures:**
- ICMP (ping) round-trip time (if available).
- HTTPS total response time using `curl`.
- Connectivity status for GitHub, Nix, and Debian repositories.

## Purpose

These tools help developers:
- Verify the performance benefits of batching optimizations.
- Diagnose slow environment setup times.
- Identify network issues that may affect the development experience.
