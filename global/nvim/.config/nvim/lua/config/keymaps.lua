local map = vim.keymap.set

-- Disable space, since it's the leader key
map("", "<Space>", "<Nop>", { silent = true })

-- Normal --

-- Increment/decrement
map("n", "+", "<C-a>", { silent = true, desc = "Increment number" })
map("n", "-", "<C-x>", { silent = true, desc = "Decrement number" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { silent = true, desc = "Select all" })

-- Copy to clipboard
map("v", "Y", '"+y', { desc = "Copy to system clipboard" })

-- New tab
map("n", "te", ":tabedit<CR>", { silent = true, desc = "New tab" })

-- Close tab
map("n", "tw", ":tabclose<CR>", { silent = true, desc = "Close tab" })

-- Next / prev tab
map("n", "<Tab>", ":tabnext<CR>", { silent = true, desc = "Next tab" })
map("n", "<S-Tab>", ":tabprevious<CR>", { silent = true, desc = "Previous tab" })

-- Retab file
map("n", "<F9>", ":retab!<CR>", { silent = true, desc = "Retab file" })

-- Splits
map("n", "s", "<C-w>s<C-w>j", { silent = true, desc = "Horizontal split" })
map("n", "vs", "<C-w>v<C-w>l", { silent = true, desc = "Vertical split" })
map("n", "ts", "<C-w>s<C-w>j:terminal<CR>", { silent = true, desc = "Horizontal split terminal" })
map("n", "tvs", "<C-w>v<C-w>l:terminal<CR>", { silent = true, desc = "Vertical split terminal" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { silent = true, desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "Go to right window" })

-- Resize with arrows
map("n", "<Up>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
map("n", "<Down>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
map("n", "<Left>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })
map("n", "<Right>", ":vertical resize +2<CR>", { silent = true, desc = "Increase window width" })

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- Move line up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "Move line down" })
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true, desc = "Move line up" })

-- Insert --

-- Press jk/jj fast to exit insert mode
map("i", "jk", "<Esc>", { silent = true, desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { silent = true, desc = "Exit insert mode" })

-- Visual --

-- Stay in indent mode
map("v", "<", "<gv", { silent = true, desc = "Indent left" })
map("v", ">", ">gv", { silent = true, desc = "Indent right" })

-- Find selected
map("v", "//", [[y/\V<C-R>=escape(@",'/')<CR><CR>]], { silent = true, desc = "Search for selection" })

-- Move selection up and down
map("v", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Move selection down" })
map("v", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Move selection up" })
map("v", "p", '"_dP', { silent = true, desc = "Paste without overwriting register" })

-- Visual block --

-- Move selection up and down
map("x", "J", ":move '>+1<CR>gv-gv", { silent = true, desc = "Move selection down" })
map("x", "K", ":move '<-2<CR>gv-gv", { silent = true, desc = "Move selection up" })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true, desc = "Move selection down" })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true, desc = "Move selection up" })

-- Maintain yank when pasting over visual selections
map("x", "p", "pgvy", { silent = true, desc = "Paste without losing yank" })

-- Better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down (display line aware)" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up (display line aware)" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Clear search highlights
map("n", "<leader>H", "<cmd>nohl<CR>", { silent = true, desc = "Clear Search Highlights" })

-- Window --
map("n", "<leader>wq", "<cmd>q<CR>", { silent = true, desc = "Write/Quit" })
map("n", "<leader>wQ", "<cmd>qa!<CR>", { silent = true, desc = "Force Quit All" })
map("n", "<leader>wr", "<C-w>R", { silent = true, desc = "Rotate window/buffer" })
map("n", "<leader>ws", "<cmd>wa<CR>", { silent = true, desc = "Save All" })
