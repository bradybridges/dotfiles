local status, bluloco = pcall(require, 'bluloco')

if (not status) then return end

bluloco.setup({
	style = 'dark',
	transparent = true,
})

vim.cmd('colorscheme bluloco')
