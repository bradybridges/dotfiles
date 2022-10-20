local keymap = vim.keymap

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
keymap.set('n', 'te', ':tabedit<CR>')

-- Close Tab
keymap.set('n', 'tw', ':tabclose<CR>')

-- Reload File
keymap.set('n', 'R', ':edit!<CR>')

-- Tab File
keymap.set('n', '<F9>', ':retab!<CR>')

-- Replace Trailing Whitespaces
local function TrimWhitespaces()
	local save = vim.fn.winsaveview()
	vim.cmd('%s/\\\\\\@<!\\s\\+$//e')
	vim.fn.winrestview(save)
end

keymap.set('n', '<Space>T', TrimWhitespaces)

-- Split window
keymap.set('n', 's', '<C-w>s<C-w>j')
keymap.set('n', 'vs', '<C-w>v<C-w>l')
keymap.set('n', 'ts', '<C-w>s<C-w>j:terminal<CR>')
keymap.set('n', 'tvs', '<C-w>v<C-w>l:terminal<CR>')

-- Move window
keymap.set('n', '<up>', '<C-w><up>')
keymap.set('n', '<down>', '<C-w><down>')
keymap.set('n', '<left>', '<C-w><left>')
keymap.set('n', '<right>', '<C-w><right>')
keymap.set('n', '<C-k>', '<C-w><up>')
keymap.set('n', '<C-j>', '<C-w><down>')
keymap.set('n', '<C-h>', '<C-w><left>')
keymap.set('n', '<C-l>', '<C-w><right>')

-- Next/Prev Buffer
keymap.set('n', 'bn', ':bnext<CR>')
keymap.set('n', 'bp', ':bprevious<CR>')

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
keymap.set('n', '<Space>~', ':terminal<CR>')
