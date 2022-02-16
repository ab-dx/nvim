--local status_ok, lualine = pcall(require, "lualine")
--if not status_ok then
--	return
--end
--
--local hide_in_width = function()
--	return vim.fn.winwidth(0) > 80
--end
--
--local diagnostics = {
--	"diagnostics",
--	sources = { "coc" },
--	sections = { "error", "warn" },
--	symbols = { error = " ", warn = " " },
--	colored = false,
--	update_in_insert = false,
--	always_visible = true,
--}
--
--local diff = {
--	"diff",
--	colored = false,
--	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
--  cond = hide_in_width
--}
--
--local mode = {
--	"mode",
--	fmt = function(str)
--		return "-- " .. str .. " --"
--	end,
--}
--
--local filetype = {
--	"filetype",
--	icons_enabled = false,
--	icon = nil,
--}
--
--local branch = {
--	"branch",
--	icons_enabled = true,
--	icon = "",
--}
--
--local location = {
--	"location",
--	padding = 0,
--}
--
---- cool function for progress
--local progress = function()
--	local current_line = vim.fn.line(".")
--	local total_lines = vim.fn.line("$")
--	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--	local line_ratio = current_line / total_lines
--	local index = math.ceil(line_ratio * #chars)
--	return chars[index]
--end
--
--local spaces = function()
--	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
--end
--
----local custom_scheme = require'lualine.themes.catppuccin'
----custom_scheme.insert.a.bg = custom_scheme.normal.a.bg
----custom_scheme.insert.a.fg = custom_scheme.normal.a.fg
--lualine.setup({
--	options = {
--		icons_enabled = true,
--		theme = 'auto',
--		component_separators = { left = "", right = "" },
--		section_separators = { left = "", right = "" },
--		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
--		always_divide_middle = true,
--	},
--	sections = {
--		lualine_a = { branch, diagnostics },
--		lualine_b = { mode },
--		lualine_c = {},
--		-- lualine_x = { "encoding", "fileformat", "filetype" },
--		lualine_x = { diff, spaces, "encoding", filetype },
--		lualine_y = { location },
--		lualine_z = { progress },
--	},
--	inactive_sections = {
--		lualine_a = {},
--		lualine_b = {},
--		lualine_c = { "filename" },
--		lualine_x = { "location" },
--		lualine_y = {},
--		lualine_z = {},
--	},
--	tabline = {},
--	extensions = {},
--})

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#1A1826',
  fg       = '#D9E0EE',
  yellow   = '#FAE3B0',
  cyan     = '#89DCEB',
  darkblue = '#96CDFB',
  green    = '#ABE9B3',
  orange   = '#F8BD96',
  violet   = '#E8A2AF',
  magenta  = '#DDB6F2',
  blue     = '#B5E8E0',
  red      = '#F28FAD',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return ''
  end,
  color = 'LualineMode',
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'coc' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}
-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

