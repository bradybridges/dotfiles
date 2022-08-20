local opt = vim.opt
local cmd = vim.cmd

cmd("autocmd!")

vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = false
opt.backupskip = { '/tmp/*', '/private/tmp/*' }
opt.inccommand = 'split'
opt.ignorecase = true
opt.smartcase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.wrap = false
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
opt.termguicolors = true
opt.relativenumber = true
opt.syntax = "ON"
opt.scrolloff = 8
opt.list = true
opt.listchars = "tab:▸ ,trail:·,space:·"
opt.autoread = true

-- Undercurl
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.wo.number = false
		vim.opt_local.relativenumber = false
	end
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = '*',
	command = "set nopaste"
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }
