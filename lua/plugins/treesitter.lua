return {
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
        local configs = require("nvim-treesitter.configs")
        
        configs.setup ({
        ensure_installed = { "python", "bash", "lua"},
        
        highlight = { enable = true },
        indent = { enable = true },
        })
    end
    }
}
