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
export EDITOR="nvim"

eval "$(starship init bash)"

export PATH=~/.local/bin:~/.local/go/bin:$PATH
export GOPATH=~/.local/go


upd() {
  echo -e "\e[32mUpdating Homebrew Packages\e[0m"
  brew update && brew upgrade
  echo " "

  echo -e "\e[32mUpdating Flatpak Packages\e[0m"
  flatpak update -y
  echo " "

  echo -e "\e[32mUpdating RPM Packages\e[0m"
  rpm-ostree cancel && rpm-ostree upgrade
}

alias ls="lsd"
eval "$(zoxide init --cmd cd bash)"
