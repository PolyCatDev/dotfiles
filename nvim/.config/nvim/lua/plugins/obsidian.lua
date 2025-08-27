return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "polybrain",
				path = "~/MAIN/Obsidian/PolyBrain/",
			},
		},
		attachments = {
			img_folder = "/Media",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 1,
		},
		ui = {
            checkboxes = {},
			bullets = {},
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianImportant = { bold = true, fg = "#d73128" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = false, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
		disable_frontmatter = true,
		mappings = {
			["K"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},
	},

	config = function(_, opts)
		require("obsidian").setup(opts)
		vim.opt.conceallevel = 2

		vim.keymap.set("n", "<leader>b", "<cmd>ObsidianBacklinks<cr>", { desc = "Show backlinks" })
		vim.keymap.set("n", "<leader>m", "<cmd>ObsidianTags<cr>", { desc = "Show tags" })
	end,
}
