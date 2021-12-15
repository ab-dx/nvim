-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use{ 'Catppuccin/nvim' }
  use { 'neoclide/coc.nvim', branch = 'release' }
--	use { 'tjdevries/colorbuddy.nvim' }

--	use { 'neovim/nvim-lspconfig' }
--	use { 'hrsh7th/cmp-nvim-lsp' }
--	use { 'hrsh7th/cmp-buffer' }
--	use { 'hrsh7th/cmp-path' }
--	use { 'hrsh7th/cmp-cmdline' }
--	use { 'hrsh7th/nvim-cmp' }
--	use { 'hrsh7th/cmp-vsnip' }
--	use { 'hrsh7th/vim-vsnip' }

--  use {
--	  'kyazdani42/nvim-tree.lua',
--	  requires = {
--		  'kyazdani42/nvim-web-devicons', -- optional, for file icon
--	  },
--	  config = function() require'nvim-tree'.setup {} end
--  }


-- use { 'windwp/windline.nvim' }
  use {
  	'nvim-lualine/lualine.nvim',
  	requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'glepnir/dashboard-nvim' }
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
	use { 'mboughaba/i3config.vim' }
	use { 'voldikss/vim-floaterm' }



end)

