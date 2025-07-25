-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Set shiftwidth to 4 and disable expandtab for css and scss files
vim.cmd([[
  autocmd FileType css,scss setlocal shiftwidth=4 noexpandtab
]])
