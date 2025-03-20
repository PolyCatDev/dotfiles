return {
    { -- LSP Manager
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, {})
        end,
    },

    { -- LSP Garbber
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "basedpyright",
                    "gopls",
                    "html",
                    "biome",
                    "astro",
                    "tailwindcss",
                },
            })
        end,
    },

    { -- LSP configurator (LSP -> nVim)
        "neovim/nvim-lspconfig",

        config = function()
            vim.keymap.set('n', '<Leader>[', vim.diagnostic.open_float, {})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

            -- Comment out these line if ur not using lsp auto-complete (lua/plugins/lsp-config.lua)
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua
            lspconfig.lua_ls.setup({ capabilities = capabilities })

            -- Py
            lspconfig.basedpyright.setup({ capabilities = capabilities })

            -- GO

            lspconfig.gopls.setup({ capabilities = capabilities })

            -- Web
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.biome.setup({ capabilities = capabilities })
            lspconfig.astro.setup({ capabilities = capabilities })
            lspconfig.tailwindcss.setup({ capabilities = capabilities })

            -- Godot
            lspconfig.gdscript.setup({ capabilities = capabilities })
            lspconfig.gdshader_lsp.setup({ capabilities = capabilities })
        end,
    },

}
