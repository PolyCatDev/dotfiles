return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                auto_install = true,
                ensure_installed = { "gdscript", "godot_resource", "gdshader" },

                highlight = { enable = true },
                indent = { enable = false },
            })
        end
    }
}
