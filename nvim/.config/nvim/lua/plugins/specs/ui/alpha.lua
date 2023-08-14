return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[   ______________________   ]],
			[[  |    __       __ __    |  ]],
			[[  |   / /      / / \ \   |  ]],
			[[  |  / /      / /   \ \  |  ]],
			[[  | / /      / /     \ \ |  ]],
			[[  | \ \     / /      / / |  ]],
			[[  |  \ \   / /      / /  |  ]],
			[[  |   \_\ /_/      /_/   |  ]],
			[[  |                      |  ]],
			[[  |    ╔═╦╦═╦═╦╦╦╦══╗    |  ]],
			[[  |    ║║║║╦╣║║║║║║║║    |  ]],
			[[  |    ╚╩═╩═╩═╩═╩╩╩╩╝    |  ]],
			[[  |______________________|  ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		--[[ local function footer() ]]
		--[[ 	local plugins = #vim.tbl_keys(require("lazy").plugins()) ]]
		--[[ 	local v = vim.version() ]]
		--[[ 	local datetime = os.date(" %A   %I:%M   %m-%d-%Y") ]]
		--[[ 	return string.format("󰂖 %d   %d.%d.%d  %s", plugins, v.major, v.minor, v.patch, datetime) ]]
		--[[ end ]]
		--[[]]
		--[[ dashboard.section.footer.val = footer() ]]

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100) / 100
				dashboard.section.footer.val = "󱐌 Lazy-loaded " .. stats.loaded .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
