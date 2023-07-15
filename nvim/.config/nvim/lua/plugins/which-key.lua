return {
	{
		{
			"folke/which-key.nvim",
			opts = function()
				require("which-key").register({
					["<leader>h"] = {
						name = "Harpoon",
						a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
						m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Menu" },
						n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Mark" },
						p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Mark" },
					},
					["<leader>z"] = {
						"<cmd>lua require('zen-mode').toggle()<cr>",
						"ZenMode",
					},
					["<leader>b"] = {
						name = "Buffers",
						c = { "<cmd>Bdelete!<cr>", "Close Buffer" },
						C = { "<cmd>BufferLinePickClose<cr>", "Pick Close Buffer" },
						B = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
					},
				})
			end,
		},
	},
}
