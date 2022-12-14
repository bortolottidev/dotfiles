local alpha = _SAFE_LOAD_PLUGIN("alpha")
if not alpha then
	return
end

--local plugins_loaded = _PLUGIN_LOADED()
local dashboard = require("alpha.themes.dashboard")

--local plugin_loaded_formatted = string.format("            [%d/%d] plugins_loaded              ", plugins_loaded, plugins_loaded)
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  [[                                                 ]],
 -- plugin_loaded_formatted
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("h", "  Notification History", ":Telescope notify <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer_builder()
  -- NOTE: requires the fortune-mod package to work
  local data = io.popen("fortune -s")
  local fortune = data:read("*a")
  data:close()

  return fortune
end

local footer_ok, footer = pcall(footer_builder)
if footer_ok then
  dashboard.section.footer.val = footer
else
  vim.notify("Cannot get a random phrase from fortune")
  dashboard.section.footer.val = "Daniele Bortolotti"
end

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
