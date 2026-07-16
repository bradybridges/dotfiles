return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	after = "catppuccin",
	keys = {
		{ "<leader>bC", "<cmd>BufferLinePickClose<CR>", desc = "Pick Close Buffer" },
		{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
		{ "<leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin Buffer" },
		{ "<leader>bR", "<cmd>edit!<CR>", desc = "Reload Buffer" },
		{ "<leader>bs", "<cmd>w<CR>", desc = "Save Buffer" },
		{ "<leader>bo", group = "Buffer Orientation To ->" },
		{ "<leader>boh", "<C-w>t<C-w>K", desc = "Horizontal Split" },
		{ "<leader>bov", "<C-w>t<C-w>H", desc = "Vertical Split" },
		{ "<leader>bw", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close Un-Pinned Buffers" },
	},
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.special.bufferline").get_theme(),
			options = {
				show_close_icon = false,
				show_buffer_close_icons = false,
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				close_command = function(bufnum)
					require("snacks").bufdelete(bufnum)
				end, -- can be a string | function, see "Mouse actions"
				right_mouse_command = function(bufnum)
					require("snacks").bufdelete(bufnum)
				end, -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "oil",
						text = "Oil",
						highlight = "Directory",
						text_align = "left",
						padding = 1,
					},
					{
						filetype = "snacks_layout_box",
						text = "󰙅  File Explorer",
						separator = true,
					},
				},
				numbers = "none",
			},
		})
	end,
}
