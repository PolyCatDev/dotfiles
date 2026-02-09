#!/bin/bash

set -ueo pipefail

mkdir -p ~/.config/tmux/plugins/
mkdir -p ~/.config/godot/

MODULES=(
    git
    bash
    ghostty
    nvim
    tmux
    util-scripts
    fastfetch
    godot
)

stow --target=${HOME} --verbose=1 ${1:-} "${MODULES[@]}"
