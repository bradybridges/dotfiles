local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = ' '

-- Reload Config
keymap.set('n', '<Leader><Enter>', ':luafile %<CR>', { noremap = true })

-- Increment/decrement
keymap.set('n', '+', '<C-a>', opts)
keymap.set('n', '-', '<C-x>', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- Copy to Clipboard
keymap.set('v', 'Y', '"+y', { noremap = true })

-- New tab
keymap.set('n', 'te', ':tabedit<CR>', opts)

-- Close Tab
keymap.set('n', 'tw', ':tabclose<CR>', opts)

-- Reload File
keymap.set('n', 'R', ':edit!<CR>', opts)

-- Tab File
keymap.set('n', '<F9>', ':retab!<CR>', opts)

-- Replace Trailing Whitespaces
local function TrimWhitespaces()
	local save = vim.fn.winsaveview()
	vim.cmd('%s/\\\\\\@<!\\s\\+$//e')
	vim.fn.winrestview(save)
end

keymap.set('n', '<Leader>T', TrimWhitespaces, opts)

-- Split window
keymap.set('n', 's', '<C-w>s<C-w>j', opts)
keymap.set('n', 'vs', '<C-w>v<C-w>l', opts)
keymap.set('n', 'ts', '<C-w>s<C-w>j:terminal<CR>', opts)
keymap.set('n', 'tvs', '<C-w>v<C-w>l:terminal<CR>', opts)

-- Vertical Split To Horizontal
keymap.set('n', '<Leader>ts', '<C-w>t<C-w>K', opts)

-- Horizontal Split to Vertical
keymap.set('n', '<Leader>tv', '<C-w>t<C-w>H', opts)

-- Move window
keymap.set('n', '<C-k>', '<C-w><up>', opts)
keymap.set('n', '<C-j>', '<C-w><down>', opts)
keymap.set('n', '<C-h>', '<C-w><left>', opts)
keymap.set('n', '<C-l>', '<C-w><right>', opts)

-- Next/Prev Buffer
keymap.set('n', 'bn', ':bnext<CR>', opts)
keymap.set('n', 'bp', ':bprevious<CR>', opts)

-- Resize window
keymap.set('n', '<left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<right>', ':vertical resize +2<CR>', opts)
keymap.set('n', '<up>', ':resize -2<CR>', opts)
keymap.set('n', '<down>', ':resize +2<CR>', opts)

-- Insert Mode
keymap.set('i', 'jj', '<Esc>', opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move blocks up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Find Selected
keymap.set('v', '//', 'y/\\V<C-R>=escape(@",\'/\')<CR><CR>', opts)

-- Escape Terminal
keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)

-- Open Terminal
keymap.set('n', '<Leader>~', ':terminal<CR>', opts)
