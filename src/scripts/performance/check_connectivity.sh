#!/usr/bin/env bash

# Connectivity and Latency Test
# Measures response times to critical infrastructure endpoints.

echo "🌐 Bolt Connectivity Check: Latency Measurement"
echo "==============================================="

endpoints=(
    "github.com"
    "deb.debian.org"
    "nixos.org"
    "google.com"
)

# Check if ping is available
HAS_PING=false
if command -v ping &> /dev/null; then
    HAS_PING=true
fi

# Check if curl is available
HAS_CURL=false
if command -v curl &> /dev/null; then
    HAS_CURL=true
fi

if [ "$HAS_PING" = false ] && [ "$HAS_CURL" = false ]; then
    echo "❌ Error: This script requires 'ping' or 'curl' to measure latency."
    exit 1
fi

for host in "${endpoints[@]}"; do
    printf "Testing %-20s ... " "$host"

    if [ "$HAS_PING" = true ]; then
        # Try pinging (3 packets)
        latency=$(ping -c 3 "$host" 2>/dev/null | tail -1 | awk -F '/' '{print $5}')
        if [ -n "$latency" ]; then
            printf "Ping: %sms " "$latency"
        else
            printf "Ping: FAILED "
        fi
    fi

    if [ "$HAS_CURL" = true ]; then
        # Measure HTTP response time using curl
        # time_total: The total time, in seconds, that the full operation lasted.
        curl_latency=$(curl -o /dev/null -s -w "%{time_total}\n" "https://$host")
        if [ $? -eq 0 ]; then
            # Convert to ms
            ms_latency=$(awk "BEGIN {print $curl_latency * 1000}")
            printf "HTTPS: %.1fms" "$ms_latency"
        else
            printf "HTTPS: FAILED"
        fi
    fi
    echo
done

echo "==============================================="
