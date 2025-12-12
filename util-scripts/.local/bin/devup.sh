#!/bin/bash

set -euo pipefail

SESSION=$(basename "$PWD")

tmux new-session -d -s "$SESSION" $EDITOR
tmux new-window -t "$SESSION"
tmux select-window -t "$SESSION:1"
tmux attach -t "$SESSION"

