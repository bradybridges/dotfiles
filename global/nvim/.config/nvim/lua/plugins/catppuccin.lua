return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	config = function()
		local status, catppuccin = pcall(require, "catppuccin")

		if not status then
			return
		end

		catppuccin.setup({
			name = "catppuccin",
			flavor = "mocha",
			integrations = {
				blink_cmp = {
					style = "bordered",
				},
				alpha = false,
				cmp = false,
				gitsigns = false,
				harpoon = true,
				hop = false,
				illuminate = false,
				indent_blankline = { enabled = false },
				lsp_trouble = false,
				mason = true,
				mini = {
					enabled = true
				},
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
				noice = false,
				notify = false,
				neotree = false,
				nvimtree = false,
				semantic_tokens = true,
				snacks = {
					enabled = true,
				},
				telescope = false,
				treesitter = true,
				which_key = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
