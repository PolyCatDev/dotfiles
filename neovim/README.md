# Neovim config details

Oh hi there. You found my NeoVim config

## Features

- **Syntax Highlighting:** Using [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- **Auto Pairs:** Using [autopairs](https://github.com/windwp/nvim-autopairs)
- **Search:** Using [Telescope](https://github.com/nvim-telescope/telescope.nvim) for search
- **Code Completion:** Lua, Bash, Docker, Py, C, HTML, CSS, JS, VueJS by default
- **Code Formatters:** Using [none-ls](https://github.com/nvimtools/none-ls.nvim) and [Mason](https://github.com/williamboman/mason.nvim)
- **File Tree:** [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) as file simple file tree
- **Git inegration:** [gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [vim-fugitive](https://github.com/tpope/vim-fugitive)

## ATENTION

1. `ripgrep` package is required for live grep in Telescope Search to work
2. `binutils` package is required for Treesitter languages to load
3. `npm` package most probably required for some LSPs to work

## Installation

```bash
git clone https://github.com/PolyCatDev/polycat-config-files.git && \
cd polycat-config-files/neovim && \
mkdir -p ~/.config/nvim && \
cp * ~/.config/nvim && \
cd ../../ && \
rm -rf polycat-config-files
```

## To Do

- [ ] Keyboard shortcuts list
