return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local status, wk = pcall(require, "which-key")

		if not status then
			return
		end

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
				["<space>"] = "SPACE",
				["<cr>"] = "RET",
				["<tab>"] = "TAB",
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
			['`'] = { "<cmd>ToggleTerm direction=float<cr>", "Toggle F-term" },
			['~'] = { "<cmd>ChatGPT<CR>", "Toggle ChatGPT" },
			["<space>"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
			H = { "<cmd>nohl<cr>", "Clear Highlights" },
			b = {
				name = "Buffer",
				c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
				C = { "<cmd>BufferLinePickClose<cr>", "Pick Close Buffer" },
				D = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers" },
				p = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
				P = { "<Cmd>BufferLineTogglePin<CR>", "Toggle Pin" },
				R = { "<cmd>edit!<cr>", "Reload File" },
				s = { "<cmd>w<cr>", "Save" },
				t = {
					name = "To ->",
					h = { "<C-w>t<C-w>K", "Horiz" },
					v = { "<C-w>t<C-w>H", "Vert" },
				},
			},
			c = {
				name = "ChatGPT",
				c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
				e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
				g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
				t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
				k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
				d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
				a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
				o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
				s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
				f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
				x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
				r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
				l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
			},
			e = { "<cmd>NvimTreeToggle<cr>", "Toggle File Tree" },
			f = {
				name = "Format(Split/Join) Item",
				t = { "<cmd>TSJToggle<cr>", "Toggle" },
				j = { "<cmd>TSJJoin<cr>", "Join" },
				s = { "<cmd>TSJSplit<cr>", "Split" },
			},
			s = {
				name = "Search",
				a = { "<cmd>ChatGPT<cr>", "ChatGPT" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				d = { "<cmd>Telesscope diagnostics<cr>", "Diagnostics" },
				D = { "<cmd>Telescope lsp_definitions<CR>", 'Definition'},
				f = { "<cmd>Telescope find_files<cr>", "Find Files" },
				g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
				G = { "<cmd>Telescope live_grep hidden=true<cr>", "Live Grep Hidden Files" },
				h = { "<cmd>Telescope find_files hidden=true<cr>", "Find Hidden Files" },
				H = { "<cmd>Telescope highlights<cr>", "Highlights" },
				o = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
				r = { "<cmd>Telescope resume<cr>", "Resume Telescope" },
				s = { "<cmd>Telescope grep_string<cr>", "Search String(under cursor)" },
				q = { "<cmd>TodoQuickFix<cr>", "Show todos in quickfix" },
				t = { "<cmd>TodoTelescope<cr>", "Show todos in telescope" }
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
			h = {
				name = "Harpoon",
				a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
				m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Menu" },
				n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Mark" },
				p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Mark" },
			},
			j = {
				name = "Hop",
				a = { "<cmd>HopChar2<cr>", "Hop Anywhere" },
				b = {
					"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
					"Hop Backwards On Line",
				},
				f = {
					"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
					"Hop Forward On Line",
				},
				s = { "<cmd>HopLineStart<cr>", "Hop Line Start" },
			},
			L = { "<cmd>Lazy<cr>", "Lazy" },
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action<cr>", "Code Action" },
				c = { "<cmd>TSContextToggle<cr>", "Toggle TS Context" },
				d = {
					"<cmd>Telescope diagnostics bufnr=0<cr>",
					"Document Diagnostics",
				},
				w = {
					"<cmd>Telescope diagnostics<cr>",
					"Workspace Diagnostics",
				},
				f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
				i = { "<cmd>LspInfo<cr>", "Info" },
				I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
				j = {
					"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
					"Next Diagnostic",
				},
				k = {
					"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
					"Prev Diagnostic",
				},
				l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
				q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
				r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
				R = { "<cmd>LspRestart<cr>", "Restart LSP" },
				s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
				S = {
					"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
					"Workspace Symbols",
				},

				t = { "<cmd>Telescope lsp_type_definitions<cr>", "Show LSP type definitions" },
				u = { "<cmd>TSUpdate<cr>", "Update Lang Servers" },
				x = { "<cmd>LspStart<cr>", "Start LSP" },
				X = { "<cmd>LspStop<cr>", "Stop LSP" },
			},
			M = { "<cmd>Mason<cr>", "Mason" },
			S = { "<cmd>w<cr>", "Save Buffer" },
			t = {
				name = "Terminal",
				b = { "<cmd>lua _BTOP_TOGGLE()<cr>", "Btop" },
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
			w = {
				name = "Window",
				q = { "<cmd>q<cr>", "Quit" },
				Q = { "<cmd>qa!<cr>", "Force Quit All" },
				s = { "<cmd>wa<cr>", "Save All" },
				t = { "<cmd>TransparentToggle<cr>", "Toggle Transparent" },
			},
			x = { "<cmd>Bdelete!<CR>", "Close Buffer" },
			X = { "<cmd>lua require('noice').cmd('dismiss')<cr>", "Clear notifications" },
			z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
		}

		wk.setup(setup)
		wk.register(mappings, { prefix = "<space>" })
	end,
}
