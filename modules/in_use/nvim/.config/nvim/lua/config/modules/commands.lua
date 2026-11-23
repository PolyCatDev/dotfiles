-- Deletes file of currently loaded buffer
vim.api.nvim_create_user_command("DeleteCurrentFile", function()
	local file = vim.fn.expand("%:p")
	if file ~= "" and vim.fn.filereadable(file) == 1 then
		os.remove(file)
		vim.cmd("bdelete!")
	end
end, {})
