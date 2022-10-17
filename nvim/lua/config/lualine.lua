local lualine = _SAFE_LOAD_PLUGIN("lualine")
if not lualine then
	return
end

local large_screen_width = function()
	return vim.fn.winwidth(0) > 80
end

local format_diagnostics = function(str)
  local no_error_warning = string.len(str) == 0
  -- show OK when theres no error or warning to show
  if no_error_warning then
    return ' Ok'
  end

  return str
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = false,
  fmt = format_diagnostics
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = large_screen_width,
  padding = { left = 1, right = 2 }
}

local mode = {
	"mode",
	fmt = function(str)
		return str
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

lualine.setup({
	options = {
		icons_enabled = true,
    -- require tokyonight theme installed
		theme = "tokyonight",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diff},
    lualine_c = { diagnostics },
    lualine_x = {'encoding', 'fileformat', filetype},
    lualine_y = {'progress'},
    lualine_z = {'filename', 'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
	tabline = {},
	extensions = {},
})
