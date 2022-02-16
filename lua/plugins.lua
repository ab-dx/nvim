-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use { 'lewis6991/impatient.nvim' }
	use { 'wbthomason/packer.nvim',
  	config = {
  		-- Move to lua dir so impatient.nvim can cache it
  		compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  	}
	}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
	use { 'windwp/nvim-autopairs' }
  use { 'neoclide/coc.nvim', branch = 'release' }
	use { 'dstein64/vim-startuptime', cmd = 'StartupTime' }
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'glepnir/dashboard-nvim' }
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} },
		cmd = "Telescope"
  }
	use { 'mboughaba/i3config.vim' }
	use { 'voldikss/vim-floaterm', cmd = 'FloatermToggle' }
	use { 'real-99/onedarker.nvim' }
	use { 'Mofiqul/dracula.nvim' }
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
	use {
  	'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}




end)

