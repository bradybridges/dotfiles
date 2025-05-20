local options = {
	autoread = true,
	background = "dark",
	backup = false,                       -- creates a backup file
	cmdheight = 1,                        -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0,                     -- so that `` is visible in markdown files
	cursorline = true,                    -- highlight the current line
	expandtab = false,                    -- convert tabs to spaces
	fileencoding = "utf-8",               -- the encoding written to a file
	guifont = "monospace:h17",            -- the font used in graphical neovim applications
	hlsearch = true,                      -- highlight all matches on previous search pattern
	ignorecase = true,                    -- ignore case in search patterns
	linebreak = true,                     -- companion to wrap, don't split words
	list = true,
	listchars = "tab:| ,trail:·,space:·",
	mouse = "",                           -- allow the mouse to be used in neovim
	number = true,                        -- set numbered lines
	numberwidth = 4,                      -- set number column width to 2 {default 4}
	pumblend = 5,
	pumheight = 10,                       -- pop up menu height
	relativenumber = true,                -- set relative numbered lines
	scrolloff = 8,                        -- minimal number of screen lines to keep above and below the cursor
	shiftwidth = 4,                       -- the number of spaces inserted for each indentation
	showmode = false,                     -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,                      -- always show tabs
	sidescrolloff = 8,                    -- minimal number of screen columns either side of cursor if wrap is `false`
	signcolumn = "yes",                   -- always show the sign column, otherwise it would shift the text each time
	smartcase = true,                     -- smart case
	smartindent = true,                   -- make indenting smarter again
	splitbelow = true,                    -- force all horizontal splits to go below current window
	splitright = true,                    -- force all vertical splits to go to the right of current window
	swapfile = false,                     -- creates a swapfile
	syntax = "ON",
	tabstop = 4,                          -- insert 2 spaces for a tab
	termguicolors = true,                 -- set term gui colors (most terminals support this)
	timeout = true,
	timeoutlen = 300,                     -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                      -- enable persistent undo
	updatetime = 300,                     -- faster completion (4000ms default)
	whichwrap = "bs<>[]hl",               -- which "horizontal" keys are allowed to travel to prev/next line
	wildoptions = "pum",
	winblend = 0,
	wrap = false,                         -- display lines as one long line
	writebackup = false,                  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append("c")                         -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-")                         -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })       -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

-- relace eob ~ with space
vim.opt.fillchars:append("eob: ")

-- No line numbers in terminal windows
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.wo.number = false
		vim.opt_local.relativenumber = false
	end,
})
