return {
    { -- LSP Manager
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    { -- LSP Garbber
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "basedpyright", "quick_lint_js"}
            })
        end
    },

    { -- LSP Connector (LSP -> nVim)
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})
        end
    }
}
