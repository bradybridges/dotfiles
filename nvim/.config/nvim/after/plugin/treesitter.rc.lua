local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		"tsx",
		"javascript",
		"typescript",
		"lua",
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
