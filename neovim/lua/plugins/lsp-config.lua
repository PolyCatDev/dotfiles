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
					"html",
					"cssls",
					"quick_lint_js",
                    "astro",
				},
			})
		end,
	},

	{ -- LSP configurator (LSP -> nVim)
		"neovim/nvim-lspconfig",

		config = function()
            -- Comment out these line if ur not using lsp auto-complete (lua/plugins/lsp-config.lua)
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- Py
			lspconfig.basedpyright.setup({ capabilities = capabilities })

            -- Astro
			lspconfig.astro.setup({ capabilities = capabilities })

			-- html, css and js
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.quick_lint_js.setup({ capabilities = capabilities })

            -- Godot
			lspconfig.gdscript.setup({ capabilities = capabilities })
			lspconfig.gdshader_lsp.setup({ capabilities = capabilities })

		end,
	},
}
