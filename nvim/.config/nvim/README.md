Oh hi there. You found my NeoVim config

# Features

- **Syntax Highlighting:** Using [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- **Auto Pairs:** Using [autopairs](https://github.com/windwp/nvim-autopairs)
- **Search:** Using [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- **Code Completion:** Lua, Py, Ruby, Go, Godot, C, C++ and web formats by default
- **Code Formatters:** Using [none-ls](https://github.com/nvimtools/none-ls.nvim) and [Mason](https://github.com/williamboman/mason.nvim)
- **File Tree:** [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) as file simple file tree
- **Git Inegration:** [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- **Integrated Terminal:** Using [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- **Centered Code Buffers:** Using [no-neck-pain](https://github.com/shortcuts/no-neck-pain.nvim)

>[!Warning]
>1. `ripgrep` package is required for live grep in Telescope Search to work
>2. `binutils` package is required for Treesitter languages to load
>3. `npm`, `go`, `gcc`, `python` and `ruby` packages required for all LSPs to properly install

>[!TIP]
> In Godot Editor Settings paste this in `Exec Flags` to use this config as external editor
>```bash
>--server ./godothost --remote-send "<C-\><C-N>:n{file}<CR>{line}G{col}|"
>```

# Keybinds

- `leader` = space key
- `leader + p` = file search
- `leader + o` = full text search
- `leader + t` = open file tree
- `leader + f` = format current buffer
- `leader + [` = open diagnostic box for error
- `ctrl + space` = if pressed in insert mode open signature help
- `shift + k` = incpect hovered keyword 
- `leader + g` = preview git hunk
- `leader + n` = clear highlighti

