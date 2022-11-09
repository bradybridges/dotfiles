local status, packer = pcall(require, 'packer')
if (not status) then
	print('Packer is not installed')
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	-- Colorschemes
	use {
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' }
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Move anywhere in buffer
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

	-- Package Manager
	use 'wbthomason/packer.nvim' -- Plugin Manager

	-- UI
	use 'p00f/nvim-ts-rainbow' -- Rainbow brackets
	use 'lukas-reineke/indent-blankline.nvim' -- Indentation highlights
	use 'akinsho/nvim-bufferline.lua'
	use 'numToStr/FTerm.nvim' -- Floating Terminal
	use 'nvim-lualine/lualine.nvim' -- Statusline
	use 'folke/zen-mode.nvim'
	use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
	use 'williamboman/mason.nvim'
	use 'kyazdani42/nvim-web-devicons' -- File icons
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'norcalli/nvim-colorizer.lua'
	use 'jose-elias-alvarez/null-ls.nvim'

	-- Git
	use 'lewis6991/gitsigns.nvim'
	use 'dinhhuy258/git.nvim' -- For git blame & browse

	-- Snippet
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	-- Telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'ThePrimeagen/harpoon' -- Mark files and more

	-- LSP
	use 'neovim/nvim-lspconfig' -- LSP
	use 'onsails/lspkind-nvim' -- vscode-like pictograms
	use 'williamboman/mason-lspconfig.nvim'
	use 'glepnir/lspsaga.nvim' -- LSP UIs
	use 'nvim-lua/plenary.nvim' -- Common utilities

	-- CMP
	use 'hrsh7th/nvim-cmp' -- Completion
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for lua
	use 'hrsh7th/cmp-path' -- nvim-cmp source for path

	-- Commenting
	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
end)
