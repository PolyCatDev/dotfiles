-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Sets tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable soft wrap
vim.o.wrap = false

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Keybinds
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })


-- Load extra config modules
require("config.modules")

-- Load Plugins
require("config.lazy")
