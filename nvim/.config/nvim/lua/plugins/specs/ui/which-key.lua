return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		local wk_ok, wk = pcall(require, "which-key")

		if not wk_ok then
			return
		end

		local wp_config = {
			icons = {
				rules = false,
			},
		}

		wk.add({
			--[[ Quick Actions / Un-grouped ]]
			{ "<leader>`", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle F-term" },
			{ "<leader>~", "<cmd>ChatGPT<CR>", desc = "Toggle ChatGPT" },
			{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>e", "<cmd> NvimTreeToggle<cr>", desc = "Toggle Nvim Tree" },
			{ "<leader>f", "<cmd>TSJToggle<cr>", desc = "Split Join" },
			{ "<leader>H", "<cmd>nohl<cr>", desc = "Clear Search Highlights" },
			{ "<leader>x", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
			{ "<leader>X", "<cmd>lua require('noice').cmd('dismiss')<cr>", desc = "Clear notifications" },
			{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },

			--[[ Buffer ]]
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bc", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
			{ "<leader>bC", "<cmd>BufferLinePickClose<cr>", desc = "Pick Close Buffer" },
			{ "<leader>bD", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close Un-Pinned Buffers" },
			{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
			{ "<leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin Buffer" },
			{ "<leader>bR", "<cmd>edit!<cr>", desc = "Reload Buffer" },
			{ "Rleader>bs", "<cmd>w<cr>", desc = "Save Buffer" },
			{ "<leader>bo", group = "Buffer Orientation To ->" },
			{ "Rleader>boh", "<C-w>t<C-w>K", desc = "Horizontal Split" },
			{ "Rleader>bov", "<C-w>t<C-w>H", desc = "Vertical Split" },

			--[[ Git ]]
			{ "<leader>g", group = "Git" },
			{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
			{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
			{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
			{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
			{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
			{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
			{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
			{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
			{
				"<leader>gu",
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				desc = "Undo Stage Hunk",
			},
			{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{
				"<leader>gd",
				"<cmd>Gitsigns diffthis HEAD<cr>",
				desc = "Diff",
			},
			{ "<leader>gt", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },

			--[[ Harpoon ]]
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add File" },
			{ "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Menu" },
			{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next Mark" },
			{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Previous Mark" },

			--[[ Hop ]]
			{ "<leader>j", group = "Hop / Jump" },
			{ "<leader>ja", "<cmd>HopChar2<cr>", desc = "Hop Anywhere" },
			{
				"<leader>jb",
				"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
				desc = "Hop Backwards On Line",
			},
			{
				"<leader>jf",
				"<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
				desc = "Hop Forward On Line",
			},
			{ "<leader>js", "<cmd>HopLineStart<cr>", desc = "Hop Line Start" },

			--[[ Lazy ]]
			{ "<leader>L", "<cmd>Lazy<cr>", desc = "Toggle Lazy" },

			--[[ Searching ]]
			{ "<leader>s", group = "Search" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>sd", "<cmd>Telesscope diagnostics<cr>", desc = "Diagnostics" },
			{ "<leader>sD", "<cmd>Telescope lsp_definitions<CR>", desc = "Definition" },
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>sG", "<cmd>Telescope live_grep hidden=true<cr>", desc = "Live Grep Hidden Files" },
			{ "<leader>sh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Hidden Files" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
			{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume Telescope" },
			{ "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Search String(under cursor)" },
			{ "<leader>sq", "<cmd>TodoQuickFix<cr>", desc = "Show todos in quickfix" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Show todos in telescope" },

			--[[ LSP Things ]]
			{ "<leader>l", group = "LSP" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action<cr>", desc = "Code Action" },
			{ "<leader>lc", "<cmd>TSContextToggle<cr>", desc = "Toggle TS Context" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
			{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
			{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
			{ "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
			{ "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
			{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
			{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
			{ "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart LSP" },
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
			{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
			{ "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Show LSP type definitions" },
			{ "<leader>lu", "<cmd>TSUpdate<cr>", desc = "Update Lang Servers" },
			{ "<leader>lx", "<cmd>LspStart<cr>", desc = "Start LSP" },
			{ "<leader>lX", "<cmd>LspStop<cr>", desc = "Stop LSP" },

			--[[ Mason ]]
			{ "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },

			--[[ Save Buffer ]]
			{ "<leader>S", "<cmd>w<cr>", desc = "Save Buffer" },

			--[[ Terminal ]]
			{ "<leader>t", group = "Terminal" },
			{ "<leader>tb", "<cmd>lua _BTOP_TOGGLE()<cr>", desc = "Btop" },
			{ "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
			{ "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU" },
			{ "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop" },
			{ "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
			{ "<leader>tc", "<cmd>lua _CYPRESS_TOGGLE()<cr>", desc = "Cypress" },
			{ "<leader>ts", "<cmd>lua _HEADLESS_TOGGLE()<cr>", desc = "Headless Cypress" },
			{ "<leader>to", "<cmd>lua _VS_TOGGLE()<cr>", desc = "VS Code" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
			{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
			{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },

			--[[ Window ]]
			{ "<leader>w", group = "Window" },
			{ "<leader>wq", "<cmd>q<cr>", desc = "Quit" },
			{ "<leader>wQ", "<cmd>qa!<cr>", desc = "Force Quit All" },
			{ "<leader>ws", "<cmd>wa<cr>", desc = "Save All" },
			{ "<leader>wt", "<cmd>TransparentToggle<cr>", desc = "Toggle Transparent" },
		})

		wk.setup(wp_config)
	end,
}
