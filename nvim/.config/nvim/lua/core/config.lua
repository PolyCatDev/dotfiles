-- Enables Numbers
vim.cmd("set number")

-- Sets tab to 4 spaces
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

-- Disable soft wrap
vim.o.wrap = false

-- Rebind Leader
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "

-- Setup tabs in .gd files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gdscript",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})
