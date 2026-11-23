return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<Leader>p", builtin.find_files, {})
        vim.keymap.set("n", "<Leader>o", builtin.live_grep, {})
    end,
}
