return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
			--[[ { ]]
			--[[ 	filter = { ]]
			--[[ 		event = "msg_show", ]]
			--[[ 		kind = "search_count", ]]
			--[[ 	}, ]]
			--[[ 	opts = { skip = false }, ]]
			--[[ }, ]]
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			opts = {}, -- global options for the cmdline. See section on views
			format = {
				-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				-- view: (default is cmdline view)
				-- opts: any options passed to the view
				-- icon_hl_group: optional hl_group for the icon
				-- title: set to anything or empty string to hide
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = {}, -- Used by input()
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = true, -- enables the Noice messages UI
			view = "notify", -- default view for messages
			view_error = "notify", -- view for errors
			view_warn = "notify", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = false, -- view for search count messages. Set to `false` to disable
		},
		popupmenu = {
			enabled = true, -- enables the Noice popupmenu UI
			---@type 'nui'|'cmp'
			backend = "nui", -- backend to use to show regular cmdline completions
			-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
			kind_icons = {}, -- set to `false` to disable icons
		},
		-- default options for require('noice').redirect
		-- see the section on Command Redirection
		redirect = {
			view = "popup",
			filter = { event = "msg_show" },
		},
		-- You can add any custom commands below that will be available with `:Noice command`
		commands = {
			history = {
				-- options for the message history that you get with `:Noice`
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},
			-- :Noice last
			last = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
				filter_opts = { count = 1 },
			},
			-- :Noice errors
			errors = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
		},
		notify = {
			-- Noice can be used as `vim.notify` so you can route any notification like other messages
			-- Notification messages have their level and other properties set.
			-- event is always "notify" and kind can be any log level as a string
			-- The default routes will forward notifications to nvim-notify
			-- Benefit of using Noice for this is the routing and consistent history view
			enabled = true,
			view = "notify",
		},
		lsp = {
			progress = {
				enabled = false,
				-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
				-- See the section on formatting for more details on how to customize.
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = true,
				silent = false, -- set to true to not show a message if hover is not available
				view = nil, -- when nil, use defaults from documentation
				opts = {}, -- merged with defaults from documentation
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
					luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
					throttle = 50, -- Debounce lsp signature help request by 50ms
				},
				view = nil, -- when nil, use defaults from documentation
				opts = {}, -- merged with defaults from documentation
			},
			message = {
				-- Messages shown by lsp servers
				enabled = true,
				view = "notify",
				opts = {},
			},
			-- defaults for hover and signature help
			documentation = {
				view = "hover",
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
		markdown = {
			highlights = {
				["|%S-|"] = "@text.reference",
				["@%S+"] = "@parameter",
				["^%s*(Parameters:)"] = "@text.title",
				["^%s*(Return:)"] = "@text.title",
				["^%s*(See also:)"] = "@text.title",
				["{%S-}"] = "@parameter",
			},
		},
		health = {
			checker = true, -- Disable if you don't want health checks to run
		},
		smart_move = {
			-- noice tries to move out of the way of existing floating windows.
			enabled = true, -- you can disable this behaviour here
			-- add any filetypes here, that shouldn't trigger smart move.
			excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
		},
		throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
	},
	keys = {
		{
			"<S-Enter>",
			function()
				require("noice").redirect(vim.fn.getcmdline())
			end,
			mode = "c",
			desc = "Redirect Cmdline",
		},
		{
			"<leader>snl",
			function()
				require("noice").cmd("last")
			end,
			desc = "Noice Last Message",
		},
		{
			"<leader>snh",
			function()
				require("noice").cmd("history")
			end,
			desc = "Noice History",
		},
		{
			"<leader>sna",
			function()
				require("noice").cmd("all")
			end,
			desc = "Noice All",
		},
		{
			"<leader>snd",
			function()
				require("noice").cmd("dismiss")
			end,
			desc = "Dismiss All",
		},
		{
			"<c-f>",
			function()
				if not require("noice.lsp").scroll(4) then
					return "<c-f>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll forward",
			mode = {
				"i",
				"n",
				"s",
			},
		},
		{
			"<c-b>",
			function()
				if not require("noice.lsp").scroll(-4) then
					return "<c-b>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll backward",
			mode = {
				"i",
				"n",
				"s",
			},
		},
	},
}
