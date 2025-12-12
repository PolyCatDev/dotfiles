#!/bin/bash

set -euo pipefail

#Config

SESSION_NAME=debi
MOUNTDIR=server_debi_mount
SSH_ADDRESS=debi
REMOTE_DIR=/home/polycat

# Script

MOUNTDIR="/tmp/$MOUNTDIR"

if [[ ${1:-} == "a" || ${1:-} == "attach" ]]; then
    mkdir -p "$MOUNTDIR"

    if ! mountpoint -q "$MOUNTDIR"; then
        sshfs "$SSH_ADDRESS:$REMOTE_DIR" "$MOUNTDIR"
    fi

    cd "$MOUNTDIR"

    tmux new-session -d -s "$SESSION_NAME" "$EDITOR"
    tmux new-window -t "$SESSION_NAME" "ssh $SSH_ADDRESS"
    tmux select-window -t "$SESSION_NAME:1"
    tmux attach -t "$SESSION_NAME"

elif [[ ${1:-} == "d" || ${1:-} == "detach" ]]; then
    tmux kill-session -t "$SESSION_NAME"
    cd ..
    fusermount -u "$MOUNTDIR"
    rm -rf "$MOUNTDIR"

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


