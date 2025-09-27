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

# Inits
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

# Exports
export EDITOR="nvim"
export GOPATH=~/.local/go

# Aliases
alias ls="lsd"
alias editdosbox="$EDITOR ~/.var/app/io.github.dosbox-staging/config/dosbox/dosbox-staging.conf"
alias editbash="$EDITOR ~/.bashrc"

# Functions
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

alias mkpio='/bin/bash -c "$(curl -sSL https://raw.githubusercontent.com/PolyCatDev/clangd-platformio/refs/heads/main/wizard.sh)"'
