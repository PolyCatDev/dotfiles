return {
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
			},
		})

        vim.g.prettier_config = {tabWidth = 4}


		vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, {})
	end,
}
