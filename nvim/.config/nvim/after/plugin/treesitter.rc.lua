local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
	ensure_installed = 'all',
	highlight = {
		enable = true,
		disable = {},
		use_langaugetree = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than n lines, int
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
