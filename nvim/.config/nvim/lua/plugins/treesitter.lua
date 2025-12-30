return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		init = function()
			vim.g.loaded_nvim_treesitter = 1 -- Disable nvim-treesitter's installation
		end,
	},
	{
		"lewis6991/ts-install.nvim",
		lazy = false,
		config = function()
			require("ts-install").setup({
				ensure_install = {
					"lua",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
				},
				auto_install = true,
			})
		end,
	},
}
