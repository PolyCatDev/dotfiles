-- Telescope Search
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-o>', builtin.live_grep, {})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<C-l>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

