local harpoon = _SAFE_LOAD_PLUGIN("harpoon") 
if not harpoon then
  return
end

harpoon.setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4
  }
})
