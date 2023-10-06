local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.specs.treesitter" },
	{ import = "plugins.specs.lsp" },
	{ import = "plugins.specs.cmp" },
	{ import = "plugins.specs.editor" },
	{ import = "plugins.specs.ui" },
	{ import = "plugins.specs.colorschemes" },
	{ import = "plugins.specs.utils" },
})
