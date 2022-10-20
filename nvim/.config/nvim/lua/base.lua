local opt = vim.opt
local wo = vim.wo
local cmd = vim.cmd
local api = vim.api

cmd("autocmd!")

wo.number = true

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = false
opt.scrolloff = 10
opt.backupskip = { '/tmp/*', '/private/tmp/*' }
opt.inccommand = 'split'
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.wrap = false -- No Wrap lines
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
opt.termguicolors = true
opt.relativenumber = true
opt.syntax = 'ON'
opt.list = true
opt.autoread = true
opt.listchars = 'tab:▶ ,trail:·,space:·'
opt.mouse =

-- Undercurl
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = "set nopaste"
})

-- No line numbers in terminal windows
api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.wo.number = false
		vim.opt_local.relativenumber = false
	end
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }
