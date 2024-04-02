return {
	{ -- Git effects in editor
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "jp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},

	{ -- Git commands in editor
		"tpope/vim-fugitive",
	},
}
