return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua Formatter
				null_ls.builtins.formatting.stylua,

				-- Python Formatters
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
			},
		})

		vim.keymap.set("n", "jk", vim.lsp.buf.format, {})
	end,
}
