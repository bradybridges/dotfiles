return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {}, -- tree-sitter CLI must be installed system-wide
	config = function()
		require("tree-sitter-manager").setup({
			parser_dir = vim.fn.stdpath("data") .. "/site/parser",
			query_dir = vim.fn.stdpath("data") .. "/site/queries",
			assume_installed = {}, -- blacklist languages
			ensure_installed = {
				'html',
				'html_tags',
				'css',
				'scss',
				'ecma',
				'jsx',
				'javascript',
				'typescript',
				'svelte',
				'vimdoc',
				'bash',
				'json',
				'lua',
				'luadoc',
				'regex',
				'yaml'

			}, -- parsers to install at startup
			auto_install = false, -- auto-install when a new filetype is encountered
			noauto_install = {}, -- blacklist from auto_install
			highlight = true, -- enable treesitter highlighting (use list to whitelist)
			nohighlight = {}, -- blacklist from highlight
			languages = {}, -- override or add new parser sources
			nerdfont = true, -- use Nerd Font icons in the manager UI
			border = "rounded", -- border style for the TUI window
			min_width = 78, -- minimum size of the TUI
			min_height = 40,
		})
	end,
}
