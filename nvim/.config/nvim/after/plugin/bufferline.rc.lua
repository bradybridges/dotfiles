local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = 'thin',
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		diagnostics = 'nvim_lsp'
	},
	highlights = {
		buffer_selected = {
			fg = 'white',
			bg = 'none',
			bold = true,
			italic = true,
		},
	},
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>b', ':BufferLinePick<CR>')
vim.cmd [[highlight BufferLineBufferSelected none]]
