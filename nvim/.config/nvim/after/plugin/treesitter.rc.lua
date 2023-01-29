local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
	ensure_installed = 'all',
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
