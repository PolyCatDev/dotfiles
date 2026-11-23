-- Set up softwrap and enable spellchecker in markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true -- Enable soft wrapping
		vim.opt_local.linebreak = true -- Don't break in the middle of a word
        vim.opt_local.spell = true     -- Enable spellcheck
        vim.opt_local.spelllang = "en_us"

		local opts = { buffer = true, noremap = true, silent = true }

		vim.keymap.set("n", "j", "gj", opts)
		vim.keymap.set("n", "k", "gk", opts)
		vim.keymap.set("n", "<Down>", "gj", opts)
		vim.keymap.set("n", "<Up>", "gk", opts)

		vim.keymap.set("v", "j", "gj", opts)
		vim.keymap.set("v", "k", "gk", opts)
		vim.keymap.set("v", "<Down>", "gj", opts)
		vim.keymap.set("v", "<Up>", "gk", opts)
	end,
})
