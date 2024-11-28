return {
	"PolyCatDev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "hyper",
			shuffle_letter = false,
			config = {
				shortcut = {},
				packages = { enable = false },
				footer = { "" },
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
