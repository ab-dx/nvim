 require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
		section_separators = '',
		component_separators = { left = '', right = ''},
		disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'progress', 'fileformat', 'encoding'},
    lualine_y = {'filetype'},
    lualine_z = {'filesize'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree', 'toggleterm', 'fzf'}
}

