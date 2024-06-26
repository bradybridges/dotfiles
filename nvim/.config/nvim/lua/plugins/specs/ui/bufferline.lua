return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		options = {
			modified_icon = "●",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 30,
			max_prefix_length = 30,     -- prefix used when a buffer is de-duplicated
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "NvimTree",
					text = "Nvim Tree",
					highlight = "Directory",
					text_align = "left",
					padding = 1,
				},
			},
			numbers = "none",
		},
	},
}
