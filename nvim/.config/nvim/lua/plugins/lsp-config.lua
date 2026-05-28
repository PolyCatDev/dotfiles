local lsp_servers = {
	"lua_ls",
	"basedpyright",
	"gopls",
	"html",
	"vtsls",
	"astro",
	"tailwindcss",
	"clangd",
}

local tools = {
	"stylua",
	"prettier",
	"black",
	"isort",
	"gdtoolkit",
}

return {

	{ -- LSP installer and configurator
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = lsp_servers } },
		},
		init = function()
            -- Godot specific setup
			local gdproject = io.open(vim.fn.getcwd() .. "/project.godot", "r")
			if gdproject then
				io.close(gdproject)
				vim.fn.serverstart("./godothost")
			end

			vim.lsp.enable({ "gdscript", "gdshader_lsp" })
		end,
		config = function()
			-- # Keymap
			vim.keymap.set("n", "<Leader>[", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<Leader>]", vim.lsp.buf.signature_help, {})
		end,
	},

	{ -- Tool installer and configurator
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = tools } },
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.gdformat,
				},
			})

			vim.g.prettier_config = { tabWidth = 4 }

			vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, {})
		end,
	},

	{ -- LSP completion engine
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
