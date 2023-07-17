local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Replace Trailing Whitespaces
local function TrimWhitespaces()
	local save = vim.fn.winsaveview()
	vim.cmd("%s/\\\\\\@<!\\s\\+$//e")
	vim.fn.winrestview(save)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --

-- Trim Whitespace
-- keymap("n", "<Leader>T", TrimWhitespaces, opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Copy to Clipboard
keymap("v", "Y", '"+y', { noremap = true })

-- New tab
keymap("n", "te", ":tabedit<CR>", opts)

-- Close Tab
keymap("n", "tw", ":tabclose<CR>", opts)

-- Next / Prev Tab
keymap("n", "<Tab>", ":tabNext<cr>", opts)
keymap("n", "<S-Tab>", ":tablast<cr>", opts)

-- Reload File
keymap("n", "R", ":edit!<CR>", opts)

-- Tab File
keymap("n", "<F9>", ":retab!<CR>", opts)

-- Splits
keymap("n", "s", "<C-w>s<C-w>j", opts)
keymap("n", "vs", "<C-w>v<C-w>l", opts)
keymap("n", "ts", "<C-w>s<C-w>j:terminal<CR>", opts)
keymap("n", "tvs", "<C-w>v<C-w>l:terminal<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Find Selected
keymap("v", "//", "y/\\V<C-R>=escape(@\",'/')<CR><CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Maintain yank when pasting over visual selections
keymap("x", "p", "pgvy", opts)
