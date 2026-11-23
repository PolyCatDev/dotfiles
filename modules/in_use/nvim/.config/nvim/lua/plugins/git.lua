return {
	{ -- Git effects in editor
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<Leader>g", ":Gitsigns preview_hunk<CR>", {})
		end,
	},

}
