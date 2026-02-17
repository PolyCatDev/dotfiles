#!/usr/bin/env bash

set -euo pipefail

if [ -n "${1-}" ]; then
    cd $1
fi

session=$(basename "$PWD")

tmux new-session -d -s "$session" "$EDITOR"
tmux new-window -t "$session"
tmux select-window -t "$session:1"
tmux attach -t "$session"
