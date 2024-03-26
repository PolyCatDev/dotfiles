-- Telescope Search
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-o>', builtin.live_grep, {})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<C-l>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- LSP
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n', 'v' }, 'ca', vim.lsp.buf.code_action, {})
