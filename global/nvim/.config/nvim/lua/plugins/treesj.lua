return {
	"Wansmer/treesj",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>ls", "<cmd>TSJToggle<CR>", desc = "Split / Join" },
	},
	opts = {
		use_default_keymaps = false,
		max_join_length = 200,
	},
}
