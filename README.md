# What is this?

PolyCat's NeoVim config files.

### Features
1. [Telescope](https://github.com/nvim-telescope/telescope.nvim) for search
2. Snippets for most languages
3. Code completion for languages (lua, bash, py, and js by default)
4. Formatters thru [none-ls](https://github.com/nvimtools/none-ls.nvim) and [Mason](https://github.com/williamboman/mason.nvim)
5. [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) as file browser
6. Cool status bar with [lualine](https://github.com/nvim-lualine/lualine.nvim)
7. [Gruvbox theme](https://github.com/ellisonleao/gruvbox.nvim)
8. Git inegration with [gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [vim-fugitive](https://github.com/tpope/vim-fugitive)

# ATENTION
1. `ripgrep` package is required for live grep in Telescope Search to work
2. `binutils` package is required for Treesitter languages to load
3. `npm` package is required for Bash LSP to work

# Installation
```bash
cd ~/.config && \
git clone https://codeberg.org/PolyCat/neovim-config.git && \
mv neovim-config nvim && \
cd ~
```

# To Do
- [ ] Keyboard shortcuts list
