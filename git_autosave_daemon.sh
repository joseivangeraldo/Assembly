#!/usr/bin/env bash
################################################################################
# git_autosave_daemon.sh
#
# Simple autosave daemon for a git repo: periodically checks for local changes,
# commits them with a timestamped message, and pushes to the remote.
#
# Usage:
#   From the repo root: ./git_autosave_daemon.sh &
#   Configure interval by exporting AUTOSAVE_INTERVAL (seconds) or passing env
#   Example: AUTOSAVE_INTERVAL=30 nohup ./git_autosave_daemon.sh &
#
# Notes:
# - This script does a `git add -A` and commits everything. Use with care.
# - It logs actions to .git_autosave.log in the repo root.
# - For production use consider a systemd user service or adding excludes.
################################################################################

set -euo pipefail

# Interval (seconds) between checks. Default: 60s
INTERVAL=${AUTOSAVE_INTERVAL:-60}

# Repo directory (script location)
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
LOGFILE="$REPO_DIR/.git_autosave.log"

cd "$REPO_DIR" || { echo "Failed to cd to $REPO_DIR"; exit 1; }

echo "[git-autosave] starting at $(date +'%Y-%m-%d %H:%M:%S'), interval=${INTERVAL}s" >> "$LOGFILE"

while true; do
  # Ensure we're inside a git repo
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "[git-autosave] not a git repo at $REPO_DIR - exiting" >> "$LOGFILE"
    exit 1
  fi

  # Check for changes
  if [ -n "$(git status --porcelain)" ]; then
    NOW=$(date +'%Y-%m-%d %H:%M:%S')
    echo "[git-autosave] changes detected at $NOW, committing..." >> "$LOGFILE"

    # Stage and commit
    git add -A
    # Use a predictable commit message
    if git commit -m "autosave: $NOW" >/dev/null 2>&1; then
      echo "[git-autosave] committed at $NOW" >> "$LOGFILE"
      # Try to push, but don't exit if push fails (network/auth may not be available)
      if git push >/dev/null 2>&1; then
        echo "[git-autosave] pushed at $NOW" >> "$LOGFILE"
      else
        echo "[git-autosave] push failed at $NOW (will continue looping)" >> "$LOGFILE"
      fi
    else
      echo "[git-autosave] nothing to commit (race) at $NOW" >> "$LOGFILE"
    fi
  fi

  sleep "$INTERVAL"
done
