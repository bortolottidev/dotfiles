vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000"}

vim.cmd [[
  try
    colorscheme tokyonight
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
