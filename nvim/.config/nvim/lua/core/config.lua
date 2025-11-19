-- Enables Number Lines
vim.opt.number = true
vim.opt.relativenumber = true

-- Sets tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable soft wrap
vim.o.wrap = false

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Setup Markdown Logic
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true -- Enable soft wrapping
		vim.opt_local.linebreak = true -- Don't break in the middle of a word

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

-- Setup Godot Logic
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gdscript",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

local gdproject = io.open(vim.fn.getcwd() .. "/project.godot", "r")
if gdproject then
	io.close(gdproject)
	vim.fn.serverstart("./godothost")
end

-- Setup 2 space tabs for C and C++ files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- Custom Commands
vim.api.nvim_create_user_command("DeleteCurrentFile", function()
	local file = vim.fn.expand("%:p")
	if file ~= "" and vim.fn.filereadable(file) == 1 then
		os.remove(file)
		vim.cmd("bdelete!")
	end
end, {})

-- Keybinds
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })
