return {
	"nvim-treesitter/nvim-treesitter",
	branch="main",
	build = ":TSUpdate",
	lazy = false, -- main branch does not support lazy-loading
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		-- Install parsers (no-op if already installed)
		require("nvim-treesitter").install({
			"bash",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"regex",
			"vim",
			"vimdoc",
			"yaml",
		})

		-- Highlighting is a built-in Neovim feature in v0.12; must be enabled explicitly.
		-- The old `highlight = { enable = true }` in configs.setup() no longer works.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

		-- Textobjects: new API uses setup() for options + explicit vim.keymap.set() for keymaps
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v",
					["@parameter.inner"] = "v",
					["@function.outer"] = "v",
					["@conditional.outer"] = "V",
					["@loop.outer"] = "V",
					["@class.outer"] = "<c-v>",
				},
				include_surrounding_whitespace = false,
			},
			move = {
				set_jumps = true,
			},
		})

		-- Select text objects
		local select = require("nvim-treesitter-textobjects.select")
		local keymaps = {
			["af"] = { "@function.outer", "around a function" },
			["if"] = { "@function.inner", "inner part of a function" },
			["ac"] = { "@class.outer", "around a class" },
			["ic"] = { "@class.inner", "inner part of a class" },
			["ai"] = { "@conditional.outer", "around an if statement" },
			["ii"] = { "@conditional.inner", "inner part of an if statement" },
			["al"] = { "@loop.outer", "around a loop" },
			["il"] = { "@loop.inner", "inner part of a loop" },
			["ap"] = { "@parameter.outer", "around parameter" },
			["ip"] = { "@parameter.inner", "inside a parameter" },
		}
		for key, val in pairs(keymaps) do
			vim.keymap.set({ "x", "o" }, key, function()
				select.select_textobject(val[1], "textobjects")
			end, { desc = val[2] })
		end

		-- Move to next/previous text objects
		local move = require("nvim-treesitter-textobjects.move")
		vim.keymap.set({ "n", "x", "o" }, "]f", function()
			move.goto_next_start("@function.outer", "textobjects")
		end, { desc = "Next function" })
		vim.keymap.set({ "n", "x", "o" }, "]c", function()
			move.goto_next_start("@class.outer", "textobjects")
		end, { desc = "Next class" })
		vim.keymap.set({ "n", "x", "o" }, "]p", function()
			move.goto_next_start("@parameter.inner", "textobjects")
		end, { desc = "Next parameter" })
		vim.keymap.set({ "n", "x", "o" }, "[f", function()
			move.goto_previous_start("@function.outer", "textobjects")
		end, { desc = "Previous function" })
		vim.keymap.set({ "n", "x", "o" }, "[c", function()
			move.goto_previous_start("@class.outer", "textobjects")
		end, { desc = "Previous class" })
		vim.keymap.set({ "n", "x", "o" }, "[p", function()
			move.goto_previous_start("@parameter.inner", "textobjects")
		end, { desc = "Previous parameter" })

		-- Swap parameters
		local swap = require("nvim-treesitter-textobjects.swap")
		vim.keymap.set("n", "<leader>a", function()
			swap.swap_next("@parameter.inner")
		end, { desc = "Swap with next parameter" })
		vim.keymap.set("n", "<leader>A", function()
			swap.swap_previous("@parameter.inner")
		end, { desc = "Swap with previous parameter" })
	end,
}
