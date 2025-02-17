# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Edits
set -o vi

eval "$(starship init bash)"

export PATH=~/.local/bin:~/.local/go/bin:$PATH
export GOPATH=~/.local/go

export EDITOR="nvim"

alias ls=lsd

alias render-folder-gif='ffmpeg -framerate 24 -i frames/%04d.png -vf "scale=1280:720" final.gif'
