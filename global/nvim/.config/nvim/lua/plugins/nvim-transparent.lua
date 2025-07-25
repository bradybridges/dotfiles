return {
	"xiyaowong/nvim-transparent",
	opts = {
		extra_groups = {
			"BufferLineTabClose",
			"BufferlineBufferSelected",
			"BufferLineFill",
			"BufferLineBackground",
			"BufferLineSeparator",
			"BufferLineIndicatorSelected",
		},
	},
	keys = {
		{ "<leader>ut", "<cmd>TransparentToggle<CR>", desc = "Toggle Transparent" },
	}
}
