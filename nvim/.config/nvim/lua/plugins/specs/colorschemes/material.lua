return {
	"marko-cerovac/material.nvim",
	lazy = true,
	config = function()
		local material_ok, material = pcall(require, "material")

		if not material_ok then
			return
		end

		material.setup({
			custom_highlights = {
				Comment = { fg = "#999999" },
				CursorLine = { bg = "none" },
				Cursor = { bg = "#84ffff" },
				TreesitterContextLineNumber = { fg = "#84ffff" },
				TelescopeNormal = { fg = "#666e8a", bg = "#0f111a" },
				TelescopeResultsTitle = { fg = "#ffffff" },
				TelescopePreviewTitle = { fg = "#ffffff" },
				TelescopePromptTitle = { fg = "#ffffff" },
				TelescopePromptBorder = { fg = "#c3e88d" },
				TelescopeMatching = { fg = "#c3e88d" },
				TelescopePromptNormal = { fg = "#ffffff" },
				HarpoonBorder = { fg = "#c3e88d" },
				NoiceCmdlinePopupBorder = { fg = "#c3e88d" },
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
	end
}
