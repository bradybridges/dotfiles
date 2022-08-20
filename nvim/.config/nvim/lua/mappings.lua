local keymap = vim.keymap

local function TrimWhitespaces()
	local save = vim.fn.winsaveview()
	vim.cmd('%s/\\\\\\@<!\\s\\+$//e')
	vim.fn.winrestview(save)
end

--keymap.set('n', 'x', '"_x')

-- Reload Config
keymap.set('n', '<Space><Enter>', ':luafile %<CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Close current tab
keymap.set('n', 'tw', ':tabclose<CR>')

-- Reload File
keymap.set('n', 'R', ':edit!<CR>');

-- Retab File
keymap.set('n', '<F9>', ':retab!<CR>')

-- Replace Trailing Whitespaces
keymap.set('n', '<Space>T', TrimWhitespaces)

-- Split window
keymap.set('n', 's', '<C-w>s<C-w>j:terminal<CR>')
keymap.set('n', 'vs', '<C-w>v<C-w>l:terminal<CR>')

-- Move window
keymap.set('n', '<up>', '<C-w><up>')
keymap.set('n', '<down>', '<C-w><down>')
keymap.set('n', '<left>', '<C-w><left>')
keymap.set('n', '<right>', '<C-w><right>')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Escape Insert
keymap.set('i', 'jj', '<Esc>')

-- Shift Lines
keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Copy To Clipboard
keymap.set('v', 'Y', '"+y')

-- Find Selected
keymap.set('v', '//', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>')

-- Escape Terminal
keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Open Terminal
keymap.set('n', '<Space>`', ':terminal<CR>')

-- Hop
keymap.set('n', 'f',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>")
keymap.set('n', 'F',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>")
keymap.set('n', '<Space>s',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
keymap.set('n', '<Space>S',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
