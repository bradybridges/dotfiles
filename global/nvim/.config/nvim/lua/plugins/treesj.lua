return {
	"Wansmer/treesj",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{ "<leader>ls", "<cmd>TSJToggle<CR>", desc = "Split / Join" },
	},
	opts = {
		use_default_keymaps = false,
		max_join_length = 200,
	},
}
