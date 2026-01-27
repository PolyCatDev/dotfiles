return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		init = function()
			require("nvim-treesitter").install({
				"lua",
				"markdown",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"vim",
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
					"help",
					"mason",
					"mason_backdrop",
					"lazy",
					"lazy_backdrop",
					"no-neck-pain",
					"NvimTree",
				},
			})
		end,
	},
}
