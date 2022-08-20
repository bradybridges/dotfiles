local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"typescript",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"javascript",

	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than n lines, int
	}
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
