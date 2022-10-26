local status, hop = pcall(require, "hop")

if (not status) then return end

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Hop
keymap.set('n', 'f',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<CR>"
	, opts)
keymap.set('n', 'F',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<CR>"
	, opts)
keymap.set('n', '<Space>s',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
	, opts)
keymap.set('n', '<Space>S',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
	, opts)
keymap.set('n', '<Space>l', "<cmd>:HopLineStart<CR>", opts)

return hop.setup({
	keys = 'etovxqpdygfblzhckisuran'
})
