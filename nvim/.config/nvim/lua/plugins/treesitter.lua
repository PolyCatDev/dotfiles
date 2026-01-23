return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		init = function()
			require("nvim-treesitter").install({
				"lua",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
			})
		end,
	},
	{
		"mks-h/treesitter-autoinstall.nvim",
		lazy = false,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-autoinstall").setup({
				ignore = {
					"mason",
					"mason_backdrop",
					"lazy",
					"lazy_backdrop",
				},
			})
		end,
	},
}
