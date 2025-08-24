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
                "docker_compose_language_service",
            },
        },
    },

    { -- LSP Server Default Configs
        "neovim/nvim-lspconfig",

        config = function()
            -- # Keymap
            vim.keymap.set("n", "<Leader>[", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("i", "<C-Space>", vim.lsp.buf.signature_help, {})
            vim.keymap.set("n", "<Leader>]", vim.lsp.buf.signature_help, {})

            -- # LSPs
--            vim.lsp.config.docker_compose_language_service = {
--                root_dir = util.root_pattern(
--                    "docker-compose.yaml",
--                    "docker-compose.yml",
--                    "compose.yaml",
--                    "compose.yml"
--                ),
--            }

            vim.lsp.enable({
                "astro",
                "lua_ls",
                "basedpyright",
                "gopls",
                "html",
                "biome",
                "tailwindcss",
                "clangd",
                "gdscript",
                "gdshader_lsp",
                "docker_compose_language_service",
            })

            -- Compose filetype detector
            local util = require("lspconfig.util")
            vim.filetype.add({
                filename = {
                    ["compose.yml"] = "yaml.docker-compose",
                    ["compose.yaml"] = "yaml.docker-compose",
                    ["docker-compose.yml"] = "yaml.docker-compose",
                    ["docker-compose.yaml"] = "yaml.docker-compose",
                },
            })
        end,
    },

    { -- Extra tools that Mason does't automatically install for reasons
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "prettier",
                "black",
                "isort",
                "mesonlsp",
                "gdtoolkit",
            },
        },
    },

    { -- Link external tools as LSPs
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- Lua
                    null_ls.builtins.formatting.stylua,

                    -- Python
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,

                    -- Prettier
                    null_ls.builtins.formatting.prettier,

                    --GDToolkit
                    null_ls.builtins.formatting.gdformat,
                },
            })

            vim.g.prettier_config = { tabWidth = 4 }

            vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, {})
        end,
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
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
}
