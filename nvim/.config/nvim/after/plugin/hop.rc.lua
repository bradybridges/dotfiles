local status, hop = pcall(require, "hop")

if (not status) then return end

local keymap = vim.keymap

-- Hop
keymap.set('n', 'f',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<CR>")
keymap.set('n', 'F',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<CR>")
keymap.set('n', '<Space>s',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>")
keymap.set('n', '<Space>S',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>")
keymap.set('n', '<Space>l', "<cmd>:HopLineStart<CR>")

return hop.setup({
	keys = 'etovxqpdygfblzhckisuran'
})

