#!/bin/bash
# Log Analyzer — IT 612 Exercise
# Analyze server.log using command-line tools
#
# Run:  bash analyze.sh
# Save: bash analyze.sh | tee report.txt

LOG="server.log"

echo "=== Log Analysis Report ==="
echo ""

# ─────────────────────────────────────────────
# Step 1: Line Counts
# ─────────────────────────────────────────────
echo "--- Line Counts ---"
echo "Total lines: $(wc -l < "$LOG")"
echo "Error lines: $(grep 'ERROR' "$LOG" | wc -l)"
echo "Warning lines: $(grep 'WARN' "$LOG" | wc -l)"
echo ""

# ─────────────────────────────────────────────
# Step 2: Unique Error Messages
# ─────────────────────────────────────────────
echo "--- Unique Error Messages ---"
grep "ERROR" "$LOG" | awk '{for(i=4;i<=NF;i++) printf "%s ", $i; print ""}' | sort | uniq
echo ""

# ─────────────────────────────────────────────
# Step 3: Most Requested Endpoints
# ─────────────────────────────────────────────
echo "--- Top Endpoints ---"
grep -E "GET|POST" "$LOG" | awk '{print $5, $6}' | sort | uniq -c | sort -rn
echo ""

# ─────────────────────────────────────────────
# Step 4: User Logins
# ─────────────────────────────────────────────
echo "--- User Login Counts ---"
grep "session created for user=" "$LOG" | grep -o 'user=[a-zA-Z0-9]*' | sort | uniq -c | sort -rn
echo ""

# ─────────────────────────────────────────────
# Step 5: Report Timestamp
# ─────────────────────────────────────────────
echo "Report generated: $(date)"