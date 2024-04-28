return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function() end,
		},
		{ "windwp/nvim-ts-autotag" },
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
			},
			lazy = true,
		}
	},
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
		highlight = {
			enable = true,       -- false will disable the whole extension
			disable = { "css", "html" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
