return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		sign = { enabled = false },
		heading = { enabled = false },
		bullet = { enabled = false },
		link = { enabled = false, render_modes = false },
	},
}
