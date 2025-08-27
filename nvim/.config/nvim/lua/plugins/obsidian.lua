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
             img_folder = "/Media"
        },
        completion = {
            nvim_cmp = true,
            min_chars = 1,
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
    end,
}
