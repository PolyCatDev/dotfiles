return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                auto_install = true,
                ensure_installed = {
                    "lua",
                    "gdscript",
                    "godot_resource",
                    "gdshader",
                    "astro",
                    "typescript",
                    "css",
                    "gitcommit",
                    "git_rebase",
                    "go",
                    "cpp",
                    "yaml",
                    "markdown",
                    "python",
                    "ruby",
                },

                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
