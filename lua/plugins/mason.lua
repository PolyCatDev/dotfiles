return {
    { -- LSP Manager
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, 'ca', vim.lsp.buf.code_action, {})
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
