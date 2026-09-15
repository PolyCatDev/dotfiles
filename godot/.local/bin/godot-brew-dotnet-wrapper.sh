#!/usr/bin/env sh

export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec"
export PATH="$DOTNET_ROOT:$PATH"

exec "$(which godot)" "$@"
