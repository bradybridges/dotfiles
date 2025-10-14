return {
	"github/copilot.vim",
	cmd = "Copilot",
	enabled = true,
	init = function()
		vim.g.copilot_workspace_folders = "~/Projects/Work/"
		vim.g.copilot_no_tab_map = true

		vim.keymap.set("i", "<C-c>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
			desc = "Accept copilot completion",
		})
	end,
}
