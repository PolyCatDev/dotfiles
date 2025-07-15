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
				"nil_ls",
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

			-- Compose
			local util = require("lspconfig.util")
			vim.filetype.add({
				filename = {
					["compose.yml"] = "yaml.docker-compose",
					["compose.yaml"] = "yaml.docker-compose",
					["docker-compose.yml"] = "yaml.docker-compose",
					["docker-compose.yaml"] = "yaml.docker-compose",
				},
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
				root_dir = util.root_pattern(
					"docker-compose.yaml",
					"docker-compose.yml",
					"compose.yaml",
					"compose.yml"
				),
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
				"mesonlsp",
                "gdtoolkit"
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
