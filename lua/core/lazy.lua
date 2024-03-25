-- Lazy Package Manager Install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Variables 
local plugins =
    -- Gruvbox Theme
    'plugins.gruvbox',
    
    -- Telescope Search
    'plugins.telescope'


local opts = {}

-- Calling Lazy Package Manager with the variables form the top
require("lazy").setup(plugins, opts)

-- Telescope Search
--local builtin = require("telescope.builtin")
--vim.keymap.set('n', '<C-p>', builtin.find_files, {})

