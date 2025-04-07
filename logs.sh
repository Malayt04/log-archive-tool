#!/bin/bash

# -----------------------------
# 📦 Log Archiver CLI Tool
# -----------------------------

# Check if user provided the directory path
if [ -z "$1" ]; then
  echo "❌ Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR="$1"

# Check if the directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "❌ Error: Directory '$LOG_DIR' does not exist."
  exit 1
fi

# Create archive directory if it doesn't exist
ARCHIVE_DIR="./archived_logs"
mkdir -p "$ARCHIVE_DIR"

# Create timestamped archive filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# Compress the logs
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

# Log the archiving action
LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"
echo "Archived $LOG_DIR to $ARCHIVE_NAME on $(date)" >> "$LOG_FILE"

# Final output
echo "✅ Logs archived successfully:"
echo "→ Archive: $ARCHIVE_PATH"
echo "→ Log entry added to: $LOG_FILE"
