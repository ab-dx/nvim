local bg2 = "#1E1E28"
local bg = "#15121C"
local bg3 = bg
local fg = "#D7DAE0"
local accent = "#A4B9EF"
local accent2 = "#E28C8C" -- Not saved
local accent3 = "#EADDA0" -- Not saved

require("bufferline").setup{
	options = {
		offsets = {{filetype = "coc-explorer", text = "" , text_align = "center"}},
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 13, -- prefix used when a buffer is de-duplicated
		tab_size = 20,
		view = "multiwindow",
		diagnostics = "nvim_lsp",
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant-cons",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = 'directory'
	},
	highlights = {
		fill = {
			guibg = bg
		},
		background = {
			guibg = bg3
		},

		-- buffer
		buffer_selected = {
			guifg = fg,
			guibg = bg2,
			gui = ""
		},
		separator = {
			guifg = bg,
			guibg = bg3
		},
		separator_selected = {
			guifg = bg,
			guibg = bg2
		},
		separator_visible = {
			guifg = bg,
			guibg = bg
		},
		indicator_selected = {
			guifg = accent,
			guibg = bg2
		},

		-- tabs over right
		tab = {
			guifg = fg,
			guibg = bg3
		},
		tab_selected = {
			guifg = accent2,
			guibg = bg2
		},
		tab_close = {
			guifg = accent,
			guibg = bg2
		},
		modified_selected = {
			guifg = accent2,
			guibg = bg2
		},
		modified = {
			guifg = accent3,
			guibg = bg
		},
		modified_visible = {
			guifg = accent,
			guibg = bg
		}
	},

	custom_areas = {
		right = function()
			local result = {}
			local error = vim.lsp.diagnostic.get_count(0, [[Error]])
			local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
			local info = vim.lsp.diagnostic.get_count(0, [[Information]])
			local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

			if error ~= 0 then
				result[1] = {text = "  " .. error, guifg = "#EC5241"}
			end

			if warning ~= 0 then
				result[2] = {text = "  " .. warning, guifg = "#EFB839"}
			end

			if hint ~= 0 then
				result[3] = {text = "  " .. hint, guifg = "#A3BA5E"}
			end

			if info ~= 0 then
				result[4] = {text = "  " .. info, guifg = "#7EA9A7"}
			end
			return result
		end
	}
}

