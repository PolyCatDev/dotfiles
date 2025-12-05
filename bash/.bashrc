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
export DOTNET_ROOT="/home/linuxbrew/.linuxbrew/opt/dotnet/libexec"

# Aliases
command -v lsd > /dev/null && alias ls="lsd"
alias dosedit="$EDITOR ~/.var/app/io.github.dosbox-staging/config/dosbox/dosbox-staging.conf"
alias bashedit="$EDITOR ~/.bashrc"

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

pyprojectinit() {
cat << EOF > pyproject.toml
[project]
name = "$(basename $PWD)"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=$(python --version | awk '{print $2}' | rev | cut -d. -f2- | rev)"
dependencies = []
EOF

echo -e "\e[32mCreated \"pyproject.toml\"\e[0m"

}

alias mkpio='/bin/bash -c "$(curl -sSL https://raw.githubusercontent.com/PolyCatDev/clangd-platformio/refs/heads/main/wizard.sh)"'
