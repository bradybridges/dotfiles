return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	keys = {
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
	},
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

		local btop = Terminal:new({ cmd = "btop", hidden = true })

		function _BTOP_TOGGLE()
			btop:toggle()
		end

		local htop = Terminal:new({ cmd = "htop", hidden = true })

		function _HTOP_TOGGLE()
			htop:toggle()
		end

		local python = Terminal:new({ cmd = "python3", hidden = true })

		function _PYTHON_TOGGLE()
			python:toggle()
		end

		local todo = Terminal:new({ cmd = 'todo', hidden = true })

		function _TODO_TOGGLE()
			todo:toggle()
		end

		local yazi = Terminal:new({ cmd = 'yazi', hidden = true })

		function _YAZI_TOGGLE()
			yazi:toggle()
		end
	end,
}
