return {
	{ -- Snippets Engine
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{ -- Friendly Snippets
		"rafamadriz/friendly-snippets",
	},

    { -- LSP Snippets Engine
        "hrsh7th/cmp-nvim-lsp",
    },

	{ -- Display Engine
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})

            -- Add autocommand for loading snippets
            vim.cmd([[
                augroup LoadSnippetsOnFiletype
                    autocmd!
                    autocmd BufEnter * lua LoadSnippets()
                augroup END
            ]])

            function LoadSnippets()
                if vim.bo.filetype == 'lua' then
                    require('luasnip.loaders.from_vscode').lazy_load()
                end
                -- Add similar conditionals for other filetypes as needed
            end
		end,
	},
}
