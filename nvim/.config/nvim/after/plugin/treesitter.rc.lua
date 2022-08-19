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
		"json",
		"yaml",
		"css",
		"scss",
		"html",
		"lua",
		"javascript",
		"typescript",
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = 1000,
	}
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
