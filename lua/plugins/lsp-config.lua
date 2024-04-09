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
					"bashls",
					"dockerls",
					"docker_compose_language_service",
					"basedpyright",
					"html",
					"cssls",
					"quick_lint_js",
                    "rust_analyzer"
				},
			})
		end,
	},

	{ -- LSP Connector (LSP -> nVim)
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require("lspconfig")

			-- Comment out these line if ur not using lsp auto-complete (lua/plugins/completion.lua)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- "capabilities" should be removed if not using LSP auto-complete
			-- Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- Bash
			lspconfig.bashls.setup({ capabilities = capabilities })

			-- Docker
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })

			-- Py
			lspconfig.basedpyright.setup({ capabilities = capabilities })

			-- html, css and js
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.quick_lint_js.setup({ capabilities = capabilities })

            -- Rust
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })
		end,
	},
}
