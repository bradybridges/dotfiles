local status, fTerm = pcall(require, 'FTerm')

if (not status) then return end

fTerm.setup({
	border = 'double',
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})

vim.keymap.set('n', '<Space>`', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
