#!/usr/bin/env bash

set -ueo pipefail

pkgs=(
    neovim
    tree-sitter
    tree-sitter-cli
    ripgrep
    node
    go
)

brew install ${pkgs[@]}
