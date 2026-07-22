return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 2,
			max_width = 90,
			max_height = 0,
			border = "rounded",
		},
	},
	keys = {
		{
			"<leader>o",
			function()
				require("oil").open_float()
			end,
			desc = "Open Parent Directory (float)",
		},
	},
}
