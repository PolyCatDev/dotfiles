return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = { "branch" },
				lualine_c = { "diagnostics", "filename" },
				lualine_x = { "lsp_status", "filetype" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
