#!/usr/bin/env bash

set -euo pipefail

# Config

session_name="debi"
mountdir="server_${session_name}_mount"
ssh_address="debi"
remote_dir="/home/polycat/homelab"

# Logic
mountdir="/tmp/${mountdir}"

# Required commands
required_cmds=(ssh sshfs tmux fusermount mountpoint)

for cmd in "${required_cmds[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "ERROR: Required command not found: $cmd" >&2
        exit 1
    fi
done

if [[ ${1:-} == "a" || ${1:-} == "attach" ]]; then
    mkdir -p "$mountdir"

    if ! mountpoint -q "$mountdir"; then
        sshfs "${ssh_address}:${remote_dir}" "$mountdir"
    fi

    # Start tmux session in mount directory (no cd)
    tmux new-session -d -s "$session_name" -c "$mountdir" "$EDITOR"
    tmux new-window -t "$session_name" "ssh -t ${ssh_address} 'cd \"${remote_dir}\" && exec \$SHELL'"
    tmux select-window -t "${session_name}:1"
    tmux attach -t "$session_name"

elif [[ ${1:-} == "d" || ${1:-} == "detach" ]]; then
    tmux kill-session -t "$session_name" 2>/dev/null || true
    fusermount -uz "$mountdir"
    rm -rf "$mountdir"

else
    echo -e "\e[31mERROR: No arguments provided\e[0m"
    echo ""
    echo -e "\e[32mUsage:\e[0m"
    echo "\"attach\" or \"a\" -> starts server session"
    echo "\"detach\" or \"d\" -> stops server session"
    echo ""
    echo -e "\e[32mRequirements:\e[0m"
    echo "- ssh"
    echo "- sshfs"
    echo "- tmux"
fi
