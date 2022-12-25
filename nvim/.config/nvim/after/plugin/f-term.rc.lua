local status, fTerm = pcall(require, 'FTerm')

if (not status) then return end

fTerm.setup({
	border = 'double',
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})

-- Lazygit floating terminal
local lg = fTerm:new({
	cmd = "lazygit"
})

-- Toggle fTerm
vim.keymap.set('n', ';`', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })

 -- toggle fTerm lazygit terminal
vim.keymap.set('n', ';l', function()
	lg:toggle()
end)
