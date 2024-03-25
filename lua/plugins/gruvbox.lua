return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = ...,
    config = function()
        -- Loads the colorscheme
        vim.cmd("colorscheme gruvbox")
    end
}
