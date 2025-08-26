return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- delay between pressing a key and opening which-key (milliseconds)
		-- this setting is independent of vim.opt.timeoutlen
		delay = 0,
		-- Document existing key chains
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
		},
	},
	keys = {
		--Quick Actions
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{ "<leader>`", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle F-term" },
		{ "<leader>H", "<cmd>nohl<CR>", desc = "Clear Search Highlights" },
		{
			"<leader>uv",
			function()
				local new_config = not vim.diagnostic.config().virtual_lines
				vim.diagnostic.config({ virtual_lines = new_config })
			end,
			desc = "Toggle Virtual Lines",
		},
		{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename under cursor" },

		-- Buffer
		{ "<leader>bC", "<cmd>BufferLinePickClose<CR>", desc = "Pick Close Buffer" },
		{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
		{ "<leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin Buffer" },
		{ "<leader>bR", "<cmd>edit!<CR>", desc = "Reload Buffer" },
		{ "<leader>bs", "<cmd>w<CR>", desc = "Save Buffer" },
		{ "<leader>bo", group = "Buffer Orientation To ->" },
		{ "<leader>boh", "<C-w>t<C-w>K", desc = "Horizontal Split" },
		{ "<leader>bov", "<C-w>t<C-w>H", desc = "Vertical Split" },
		{ "<leader>bw", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close Un-Pinned Buffers" },

		--[[ Window ]]
		{ "<leader>w", group = "Window" },
		{ "<leader>wq", "<cmd>q<CR>", desc = "Write/Quit" },
		{ "<leader>wQ", "<cmd>qa!<CR>", desc = "Force Quit All" },
		{ "<leader>wr", "<C-w>R", desc = "Rotate window/buffer" },
		{ "<leader>ws", "<cmd>wa<CR>", desc = "Save All" },
		{ "<leader>wc", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
		{ "<leader>wC", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
	},
}
