local theme = _SAFE_LOAD_PLUGIN("tokyonight")
if not theme then 
  vim.cmd [[
    colorscheme default
    set background=dark
  ]]
  return
end

vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000"}

-- fix background out of box when triggering diagnostic goto_next
theme.setup({
  styles = {
    floats = "transparent"
  }
})

vim.cmd("colorscheme tokyonight")
