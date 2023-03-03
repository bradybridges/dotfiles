local material_ok, material = pcall(require, "material")

if not material_ok then
	return
end

material.setup({
	custom_highlights = {
		Comment = { fg = "#999999" },
		CursorLine = { bg = "none" },
		Cursor = { bg = "#84ffff" },
	},
	plugins = { -- Uncomment the plugins that you use to highlight them
		"gitsigns",
		"hop",
		"indent-blankline",
		"nvim-cmp",
		"nvim-tree",
		"nvim-web-devicons",
		"telescope",
		"which-key",
	},
	disable = {
		background = false,
	},
	lualine_style = "stealth",
})
