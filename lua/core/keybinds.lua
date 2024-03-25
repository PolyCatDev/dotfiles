-- Telescope Search
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-o>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})

