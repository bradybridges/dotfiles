return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local status_ok, lualine = pcall(require, "lualine")
		if not status_ok then
			return
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
		}

		local mode = {
			"mode",
			fmt = function(str)
				return "-- " .. str .. " --"
			end,
		}

		local branch = {
			"branch",
			icons_enabled = true,
			icon = "",
		}

		lualine.setup({
			options = {
				icons_enabled = true,
				--theme = "catppuccin",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { branch, diagnostics },
				lualine_b = { mode },
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
					},
				},
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_x = { diff, "encoding", "filetype" },
				lualine_y = { "location", "searchcount" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
					},
				},
				lualine_x = {},
				lualine_y = { "searchcount" },
				lualine_z = { "hostname" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
