local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- UI
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local status_ok, alpha = pcall(require, "alpha")
			if not status_ok then
				return
			end

			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				[[                               __                ]],
				[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
				[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
				[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
				[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
				[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
				dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
				dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
				dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
			}

			local function footer()
				return "HINT: If stuck in vim, throw away machine "
			end

			dashboard.section.footer.val = footer()

			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "Include"
			dashboard.section.buttons.opts.hl = "Keyword"

			dashboard.opts.opts.noautocmd = true
			-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
			alpha.setup(dashboard.opts)
		end,
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
		priority = 999,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local status, wk = pcall(require, "which-key")

			if not status then return end

			local setup = {
				plugins = {
					marks = true, -- shows a list of your marks on ' and `
					registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
					spelling = {
						enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
					presets = {
						operators = true, -- adds help for operators like d, y, ...
						motions = true, -- adds help for motions
						text_objects = true, -- help for text objects triggered after entering an operator
						windows = true, -- default bindings on <c-w>
						nav = true, -- misc bindings to work with windows
						z = true, -- bindings for folds, spelling and others prefixed with z
						g = true, -- bindings for prefixed with g
					},
				},
				-- add operators that will trigger motion and text object completion
				-- to enable all native operators, set the preset / operators plugin above
				operators = { gc = "Comments" },
				key_labels = {
					-- override the label used to display some keys. It doesn't effect WK in any other way.
					-- For example:
					-- ["<space>"] = "SPC",
					-- ["<cr>"] = "RET",
					-- ["<tab>"] = "TAB",
				},
				motions = {
					count = true,
				},
				icons = {
					breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					separator = "➜", -- symbol used between a key and it's label
					group = "+", -- symbol prepended to a group
				},
				popup_mappings = {
					scroll_down = "<c-d>", -- binding to scroll down inside the popup
					scroll_up = "<c-u>", -- binding to scroll up inside the popup
				},
				window = {
					border = "none", -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
					padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
					winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
					zindex = 1000, -- positive value to position WhichKey above other floating windows.
				},
				layout = {
					height = { min = 4, max = 25 }, -- min and max height of the columns
					width = { min = 20, max = 50 }, -- min and max width of the columns
					spacing = 3, -- spacing between columns
					align = "left", -- align columns left, center or right
				},
				ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
				show_help = true, -- show a help message in the command line for using WhichKey
				show_keys = true, -- show the currently pressed key and its label as a message in the command line
				triggers = "auto", -- automatically setup triggers
				-- triggers = {"<leader>"} -- or specifiy a list manually
				-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
				triggers_nowait = {
					-- marks
					"`",
					"'",
					"g`",
					"g'",
					-- registers
					'"',
					"<c-r>",
					-- spelling
					"z=",
				},
				triggers_blacklist = {
					-- list of mode / prefixes that should never be hooked by WhichKey
					-- this is mostly relevant for keymaps that start with a native binding
					i = { "j", "k" },
					v = { "j", "k" },
				},
				-- disable the WhichKey popup for certain buf types and file types.
				-- Disabled by default for Telescope
				disable = {
					buftypes = {},
					filetypes = {},
				},
			}

			local mappings = {
				["<space>"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
				H = { "<cmd>nohl<cr>", "Clear Highlights" },
				b = {
					name = "Buffer",
					t = {
						name = "To ->",
						h = { "<C-w>t<C-w>K", "Horiz" },
						v = { "<C-w>t<C-w>H", "Vert" },
					},
				},
				e = { "<cmd>NvimTreeToggle<cr>" , "Toggle File Tree" },
				f = {
					name = "Find / Search",
					f = { "<cmd>Telescope find_files<cr>", "Find Files" },
					g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
					r = { "<cmd>Telescope resume<cr>", "Resume Telescope" },
				},
				g = {
					name = "Git",
					g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
					j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
					k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
					l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
					p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
					r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
					R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
					s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
					u = {
						"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
						"Undo Stage Hunk",
					},
					o = { "<cmd>Telescope git_status<cr>", "Status" },
					b = { "<cmd>Telescope git_branches<cr>", "Branches" },
					c = { "<cmd>Telescope git_commits<cr>", "Commits" },
					d = {
						"<cmd>Gitsigns diffthis HEAD<cr>",
						"Diff",
					},
					t = { "<cmd>GitBlameToggle<cr>", "Toggle Git Blame" },
				},
				t = {
					name = "Terminal",
					n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
					u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
					t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
					p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
					c = { "<cmd>lua _CYPRESS_TOGGLE()<cr>", "Cypress" },
					s = { "<cmd>lua _HEADLESS_TOGGLE()<cr>", "Headless Cypress" },
					o = { "<cmd>lua _VS_TOGGLE()<cr>", "VS Code" },
					f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
					h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
					v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
				},
				z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
			}

			wk.setup(setup)
			wk.register(mappings, { prefix = "<space>" })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {
				on_attach = on_attach,
				disable_netrw = false,
				hijack_netrw = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
				renderer = {
					root_folder_modifier = ":t",
					icons = {
						glyphs = {
							default = "",
							symlink = "",
							folder = {
								arrow_open = "",
								arrow_closed = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "",
								staged = "S",
								unmerged = "",
								renamed = "➜",
								untracked = "U",
								deleted = "",
								ignored = "◌",
							},
						},
					},
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				view = {
					width = 40,
					side = "left",
				},
			}
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		config = function()
			local status_ok, toggleterm = pcall(require, "toggleterm")
			if not status_ok then
				return
			end

			toggleterm.setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})

			function _G.set_terminal_keymaps()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				-- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end

			local cypress = Terminal:new({ cmd = "npm run cypress", hidden = true })

			function _CYPRESS_TOGGLE()
				cypress:toggle()
			end

			local cypressheadless = Terminal:new({ cmd = "npm run test", hidden = false })

			function _HEADLESS_TOGGLE()
				cypressheadless:toggle()
			end

			local vscode = Terminal:new({ cmd = "code .", hidden = "true" })

			function _VS_TOGGLE()
				vscode:toggle()
			end

			local node = Terminal:new({ cmd = "node", hidden = true })

			function _NODE_TOGGLE()
				node:toggle()
			end

			local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

			function _NCDU_TOGGLE()
				ncdu:toggle()
			end

			local htop = Terminal:new({ cmd = "htop", hidden = true })

			function _HTOP_TOGGLE()
				htop:toggle()
			end

			local python = Terminal:new({ cmd = "python3", hidden = true })

			function _PYTHON_TOGGLE()
				python:toggle()
			end
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			"ThePrimeagen/harpoon",
		},
		config = function()
			local status_ok, telescope = pcall(require, "telescope")
			if not status_ok then
				return
			end

			local actions = require("telescope.actions")

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			local fb_actions = require("telescope").extensions.file_browser.actions

			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },
					file_ignore_patterns = { "node_modules" },

					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-c>"] = actions.close,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,

							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						},

						n = {
							["<esc>"] = actions.close,
							["q"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["?"] = actions.which_key,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = false,
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							-- your custom insert mode mappings
							["i"] = {
								["<C-w>"] = function()
									vim.cmd("normal vbd")
								end,
							},
							["n"] = {
								-- your custom normal mode mappings
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
							},
						},
					},
				},
			})

			vim.keymap.set("n", "sf", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end)

			telescope.load_extension("file_browser")
		end
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			local status_ok, project = pcall(require, "project_nvim")

			if not status_ok then
				return
			end

			project.setup({
				active = true,
				on_config_done = nil,
				manual_mode = false,
				detection_methods = { "pattern" },
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
				show_hidden = false,
				silent_chdir = true,
				ignore_lsp = {},
				datapath = vim.fn.stdpath("data"),
			})

			local tele_status_ok, telescope = pcall(require, "telescope")
			if not tele_status_ok then
				return
			end

			telescope.load_extension("projects")
		end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				width = .75,
				height = 1,
			},
		},
	},
	-- Themes
	{ "folke/tokyonight.nvim", lazy = true },
	{ "lunarvim/darkplus.nvim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		opts = {
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
			plugins = {
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
		},
		priority = 1000,
		config = function()
			vim.g.material_style = "deep ocean"
			vim.cmd([[colorscheme material]])
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
