local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Reload Config
keymap.set('n', '<Space><Enter>', ':luafile %<CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Copy to Clipboard
keymap.set('v', 'Y', '"+y')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Close Tab
keymap.set('n', 'tw', ':tabclose<CR>')

-- Reload File
keymap.set('n', 'R', ':edit!<CR>')

-- Tab File
keymap.set('n', '<F9>', ':retab!<CR>');

-- Split window
keymap.set('n', 's', '<C-w>s<C-w>j:terminal<CR>')
keymap.set('n', 'vs', '<C-w>v<C-w>l:terminal<CR>')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', '<up>', '<C-w><up>')
keymap.set('n', '<down>', '<C-w><down>')
keymap.set('n', '<left>', '<C-w><left>')
keymap.set('n', '<right>', '<C-w><right>')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Insert Mode
keymap.set('i', 'jj', '<Esc>')

-- Shift Lines
keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Find Selected
keymap.set('v', '//', 'y/\\V<C-R>=escape(@",\'/\')<CR><CR>')

-- Escape Terminal
keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Open Terminal
keymap.set('n', '<Space>`', ':terminal<CR>')

-- Hop
keymap.set('n', 'f',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<CR>")
keymap.set('n', 'F',
	"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<CR>")
