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

			-- Py
			lspconfig.gdscript.setup({ capabilities = capabilities })
		end,
	},
}
