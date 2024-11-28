return {
    "PolyCatDev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            -- config
            theme = "hyper",
            shuffle_letter = false,
            config = {
                shortcut = {
                    { desc = " Update", action = "Lazy update", key = "u" },
                    { desc = " Files", action = "Telescope find_files", key = "p" },
                    { desc= " Config", action = "Telescope find_files cwd=~/.config/nvim/", key = "c"},
                },
                project = {
                    enable = true,
                    limit = 8,
                    icon = "  ",
                    label = "Recent Projects:",
                    action = "Telescope find_files cwd=",
                },
                packages = { enable = false },
                footer = { "" },
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
