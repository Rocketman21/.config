-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or							, branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'ThePrimeagen/harpoon'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	use 'mfussenegger/nvim-jdtls'

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine') 
		end
	})

	use 'alexghergh/nvim-tmux-navigation'

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use "lukas-reineke/indent-blankline.nvim"

	use "lewis6991/gitsigns.nvim"

	use { "ellisonleao/gruvbox.nvim" }

	require("gruvbox").setup({
		bold = false,
		palette_overrides = {
			bright_yellow = "#ebc271",
			bright_orange = "#ff9d4d",
		},
	})

	use "EdenEast/nightfox.nvim"

	use "tpope/vim-sleuth"

	use 'Exafunction/codeium.vim'

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {
				 condition = function(buf)
					local fn = vim.fn
					local utils = require("auto-save.utils.data")

					if
						fn.getbufvar(buf, "&modifiable") == 1 and
						not utils.not_in(fn.getbufvar(buf, "&filetype"), { "rust" }) then
						return true -- met condition(s), can save
					end
					return false -- can't save
				end,
			}
		end,
	})

	use "tpope/vim-obsession"
end)
