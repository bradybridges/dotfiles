return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"bash",
			"javascript",
			"json",
			"lua",
			"python",
			"typescript",
			"tsx",
			"css",
			"yaml",
			"markdown",
			"markdown_inline",
		},                          -- one of "all" or a list of languages
		ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
		highlight = {
			enable = true,          -- false will disable the whole extension
			disable = { "css" },    -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
}
