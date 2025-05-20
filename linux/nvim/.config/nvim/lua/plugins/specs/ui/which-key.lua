return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		local wk_ok, wk = pcall(require, "which-key")

		if not wk_ok then
			return
		end

		wk.add({
			--[[ Quick Actions / Un-grouped ]]
			{ "<leader>`", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle F-term" },
			{ "<leader>~", "<cmd>ChatGPT<CR>", desc = "Toggle ChatGPT" },
			{ "<leader><space>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Nvim Tree" },
			{ "<leader>f", "<cmd>TSJToggle<CR>", desc = "Split Join" },
			{ "<leader>H", "<cmd>nohl<CR>", desc = "Clear Search Highlights" },
			{ "<leader>x", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
			{ "<leader>X", "<cmd>lua require('noice').cmd('dismiss')<CR>", desc = "Clear notifications" },
			{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle ZenMode" },

			--[[ Buffer ]]
			{ "<leader>b", group = "Buffer" },
			{ "<leader>bc", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
			{ "<leader>bC", "<cmd>BufferLinePickClose<CR>", desc = "Pick Close Buffer" },
			{ "<leader>bD", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close Un-Pinned Buffers" },
			{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
			{ "<leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin Buffer" },
			{ "<leader>bR", "<cmd>edit!<CR>", desc = "Reload Buffer" },
			{ "<leader>bs", "<cmd>w<CR>", desc = "Save Buffer" },
			{ "<leader>bo", group = "Buffer Orientation To ->" },
			{ "<leader>boh", "<C-w>t<C-w>K", desc = "Horizontal Split" },
			{ "<leader>bov", "<C-w>t<C-w>H", desc = "Vertical Split" },

			--[[ Git ]]
			{ "<leader>g", group = "Git" },
			{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
			{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", desc = "Next Hunk" },
			{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", desc = "Prev Hunk" },
			{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<CR>", desc = "Blame" },
			{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", desc = "Preview Hunk" },
			{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", desc = "Reset Hunk" },
			{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", desc = "Reset Buffer" },
			{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", desc = "Stage Hunk" },
			{
				"<leader>gu",
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
				desc = "Undo Stage Hunk",
			},
			{ "<leader>go", "<cmd>Telescope git_status<CR>", desc = "Status" },
			{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Branches" },
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
			{
				"<leader>gd",
				"<cmd>Gitsigns diffthis HEAD<CR>",
				desc = "Diff",
			},
			{ "<leader>gt", "<cmd>GitBlameToggle<CR>", desc = "Toggle Git Blame" },

			--[[ Harpoon ]]
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Add File" },
			{ "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle Menu" },
			{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", desc = "Next Mark" },
			{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = "Previous Mark" },

			--[[ Hop ]]
			{ "<leader>j", group = "Hop / Jump" },
			{ "<leader>ja", "<cmd>HopChar2<CR>", desc = "Hop Anywhere" },
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
			{ "<leader>js", "<cmd>HopLineStart<CR>", desc = "Hop Line Start" },

			--[[ Lazy ]]
			{ "<leader>L", "<cmd>Lazy<CR>", desc = "Toggle Lazy" },

			--[[ Searching ]]
			{ "<leader>s", group = "Search" },
			{ "<leader>sb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "<leader>sD", "<cmd>Telescope lsp_definitions<CR>", desc = "Definition" },
			{ "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>sG", "<cmd>Telescope live_grep hidden=true<CR>", desc = "Live Grep Hidden Files" },
			{ "<leader>sh", "<cmd>Telescope find_files hidden=true<CR>", desc = "Find Hidden Files" },
			{ "<leader>sH", "<cmd>Telescope highlights<CR>", desc = "Highlights" },
			{ "<leader>so", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
			{ "<leader>sr", "<cmd>Telescope resume<CR>", desc = "Resume Telescope" },
			{ "<leader>ss", "<cmd>Telescope grep_string<CR>", desc = "Search String(under cursor)" },
			{ "<leader>sq", "<cmd>TodoQuickFix<CR>", desc = "Show todos in quickfix" },
			{ "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Show todos in telescope" },

			--[[ LSP Things ]]
			{ "<leader>l", group = "LSP" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action<CR>", desc = "Code Action" },
			{ "<leader>lc", "<cmd>TSContextToggle<CR>", desc = "Toggle TS Context" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Document Diagnostics" },
			{ "<leader>lw", "<cmd>Telescope diagnostics<CR>", desc = "Workspace Diagnostics" },
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", desc = "Format" },
			{ "<leader>li", "<cmd>LspInfo<CR>", desc = "Info" },
			{ "<leader>lI", "<cmd>LspInstallInfo<CR>", desc = "Installer Info" },
			{ "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
			{ "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
			{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", desc = "CodeLens Action" },
			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Quickfix" },
			{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
			{ "<leader>lR", "<cmd>LspRestart<CR>", desc = "Restart LSP" },
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
			{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Workspace Symbols" },
			{ "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions" },
			{ "<leader>lu", "<cmd>TSUpdate<CR>", desc = "Update Lang Servers" },
			{ "<leader>lx", "<cmd>LspStart<CR>", desc = "Start LSP" },
			{ "<leader>lX", "<cmd>LspStop<CR>", desc = "Stop LSP" },

			--[[ Mason ]]
			{ "<leader>M", "<cmd>Mason<CR>", desc = "Mason" },

			--[[ Save Buffer ]]
			{ "<leader>S", "<cmd>w<CR>", desc = "Save Buffer" },

			--[[ Terminal ]]
			{ "<leader>t", group = "Terminal" },
			{ "<leader>td", "<cmd>lua _TODO_TOGGLE()<CR>", desc = "Todo List" },
			{ "<leader>tb", "<cmd>lua _BTOP_TOGGLE()<CR>", desc = "Btop" },
			{ "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", desc = "Node" },
			{ "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<CR>", desc = "NCDU" },
			{ "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<CR>", desc = "Htop" },
			{ "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", desc = "Python" },
			{ "<leader>tc", "<cmd>lua _CYPRESS_TOGGLE()<CR>", desc = "Cypress" },
			{ "<leader>ts", "<cmd>lua _HEADLESS_TOGGLE()<CR>", desc = "Headless Cypress" },
			{ "<leader>to", "<cmd>lua _VS_TOGGLE()<CR>", desc = "VS Code" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Float" },
			{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "Horizontal" },
			{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "Vertical" },
			{ "<leader>ty", "<cmd>lua _YAZI_TOGGLE()<CR>", desc = "Yazi" },

			--[[ Window ]]
			{ "<leader>w", group = "Window" },
			{ "<leader>wq", "<cmd>q<CR>", desc = "Quit" },
			{ "<leader>wQ", "<cmd>qa!<CR>", desc = "Force Quit All" },
			{ "<leader>wr", "<C-w>R", desc = "Rotate window/buffer" },
			{ "<leader>ws", "<cmd>wa<CR>", desc = "Save All" },
			{ "<leader>wt", "<cmd>TransparentToggle<CR>", desc = "Toggle Transparent" },
			{ "<leader>wc", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
			{ "<leader>wC", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
		})

		wk.setup({
			icons = {
				rules = false,
			},
			triggers = {
				{ "<leader>", mode = { "n", "v" } },
			},
		})
	end,
}
