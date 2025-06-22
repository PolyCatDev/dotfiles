return {
    { -- LSP Package Manager
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "basedpyright",
                "gopls",
                "html",
                "biome",
                "astro",
                "tailwindcss",
                "clangd",
            },
        },
    },

    { -- Extra tools that Mason does't automatically install for reasons installer
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            opts = {
                ensure_installed = { "stylua" },
        }

    },

    { -- LSP Server Default Configs
        "neovim/nvim-lspconfig",

        config = function()
            -- # Keymap
            vim.keymap.set('n', '<Leader>[', vim.diagnostic.open_float, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

            -- # LSPs
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

            -- Clangd
            lspconfig.clangd.setup({ capabilities = capabilities })

            -- Godot
            lspconfig.gdscript.setup({ capabilities = capabilities })
            lspconfig.gdshader_lsp.setup({ capabilities = capabilities })
        end
    },

    { -- LSP Engine
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            vim.opt.pumheight = 12
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end
    },
}
