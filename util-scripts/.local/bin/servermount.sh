#!/bin/bash

set -euo pipefail

#Config

session_name=debi
mountdir=server_debi_mount
ssh_address=debi
remote_dir=/home/polycat/

# Script

mountdir="/tmp/$mountdir"

if [[ ${1:-} == "a" || ${1:-} == "attach" ]]; then
    mkdir -p "$mountdir"

    if ! mountpoint -q "$mountdir"; then
        sshfs "$ssh_address:$remote_dir" "$mountdir"
    fi

    cd "$mountdir"

    tmux new-session -d -s "$session_name" "$EDITOR"
    tmux new-window -t "$session_name" "ssh $ssh_address"
    tmux select-window -t "$session_name:1"
    tmux attach -t "$session_name"

elif [[ ${1:-} == "d" || ${1:-} == "detach" ]]; then
    tmux kill-session -t "$session_name"
    cd ..
    fusermount -u "$mountdir"
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


