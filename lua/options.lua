-- Colorscheme
vim.cmd([[
colorscheme catppuccin
]])

-- My defaults
vim.o.rnu = true
vim.o.number = true
--vim.o.background = dark
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cursorline = true
vim.o.encoding = 'UTF-8'
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.omnifunc = 'syntaxcomplete#Complete'
vim.o.conceallevel = 0
vim.o.updatetime = 300
vim.o.cmdheight = 2
vim.o.laststatus=2

vim.cmd([[
  set shortmess+=c
	let mapleader = " "
	let g:coc_global_extensions = ['coc-tsserver']
]])
