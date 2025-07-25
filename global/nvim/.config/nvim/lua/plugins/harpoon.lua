return {
	"ThePrimeagen/harpoon",
	lazy = true,
	opts = {},
	keys = {
		{ "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Add File" },
		{ "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle Menu" },
		{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", desc = "Next Mark" },
		{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = "Previous Mark" },
	}
}
