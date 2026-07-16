return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- delay between pressing a key and opening which-key (milliseconds)
		-- this setting is independent of vim.opt.timeoutlen
		delay = 0,
		-- Document top-level groups that span multiple plugins/files.
		-- Groups scoped to a single plugin are declared in that plugin's own spec.
		spec = {
			{ "<leader>b", group = "[B]uffer" },
			{ "<leader>c", group = "[C]hange" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>h", group = "[H]arpoon" },
			{ "<leader>l", group = "[L]sp" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]erminal" },
			{ "<leader>u", group = "[T]oggle" },
			{ "<leader>v", group = "[V]" },
			{ "<leader>w", group = "Window" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
