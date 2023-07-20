return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	config = function()
		local status, catppuccin = pcall(require, 'catppuccin')

		if not status then return end

		catppuccin.setup({
			name = "catppuccin",
			flavor = "mocha",
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				harpoon = true,
				hop = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				mason = true,
				mini = false,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = false, custom_bg = "lualine" },
				neotest = false,
				noice = true,
				notify = true,
				neotree = false,
				nvimtree = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		})

		vim.cmd.colorscheme "catppuccin"
	end,
}
