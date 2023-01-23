local status, packer = pcall(require, 'packer')
if (not status) then
	print('Packer is not installed')
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Easily navigate anywhere in a file
	use {
		'phaazon/hop.nvim',
		branch = 'v2',
	}

	-- Surround
	use({
		"kylechui/nvim-surround",
		requires = { 'nvim-treesitter/nvim-treesitter-textobjects' },
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})

	-- Colorschemes
	use {
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' }
	}

	--[[ use { ]]
	--[[ 	'Tsuzat/NeoSolarized.nvim', ]]
	--[[ 	requires = { 'tjdevries/colorbuddy.nvim' } ]]
	--[[ } ]]

	-- Plugin Manager
	use 'wbthomason/packer.nvim'

	-- Snippets
	use 'L3MON4D3/LuaSnip' -- Snippet engine
	use "rafamadriz/friendly-snippets" -- Snippets

	-- Telescope
	use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
	use 'nvim-telescope/telescope-file-browser.nvim' -- File browser for telescope
	use 'ThePrimeagen/harpoon' -- Mark files and more

	-- Pair Autocompletion
	use 'windwp/nvim-autopairs' -- Adds pairs for quotes, brackets, etc
	use 'windwp/nvim-ts-autotag' -- Auto closing tag for TSX

	-- UI
	use 'p00f/nvim-ts-rainbow' -- Rainbow brackets
	use 'lukas-reineke/indent-blankline.nvim' -- Indentation highlights
	use 'akinsho/nvim-bufferline.lua' -- Status line
	use 'numToStr/FTerm.nvim' -- Floating Terminal
	use 'folke/zen-mode.nvim' -- Focus on particular buffer
	use 'norcalli/nvim-colorizer.lua' -- Show colors of hex values, color names, etc
	use 'nvim-tree/nvim-web-devicons' -- File icons
	use 'nvim-lualine/lualine.nvim' -- Statusline
	use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

	-- GIT
	use 'lewis6991/gitsigns.nvim' -- UI git indications
	use 'dinhhuy258/git.nvim' -- For git blame & browse

	-- CMP
	use 'hrsh7th/nvim-cmp' -- Completion
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/cmp-nvim-lua' -- lua source for LSP
	use 'hrsh7th/cmp-path' -- path source for LSP

	-- LSP
	use 'williamboman/mason.nvim' -- Installer for LSPs, Linters, Formatters
	use 'williamboman/mason-lspconfig.nvim'
	use 'glepnir/lspsaga.nvim' -- LSP UIs
	use 'onsails/lspkind-nvim' -- vscode-like pictograms
	use 'neovim/nvim-lspconfig' -- LSP
	use 'nvim-lua/plenary.nvim' -- Common utilities
	use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

	-- Commenting
	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Colorscheme creation helper
	use 'rktjmp/lush.nvim'
end)
