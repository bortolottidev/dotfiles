local nvim_tree = _SAFE_LOAD_PLUGIN("nvim-tree")
if not nvim_tree then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}

-- TODO Should be fix, it doesnt work (collide with telescope when open nvim and find for a file)
-- -- nvim-tree is also there in modified buffers so this function filter it out
-- local modifiedBufs = function(bufs)
--     local t = 0
--     for _,v in pairs(bufs) do
--         if v.name:match("NvimTree_") == nil then
--             t = t + 1
--         end
--     end
--     return t
-- end
--
-- -- auto close nvim when nvim tree is the last window and 
-- -- there's no buffer unsaved
-- -- @link https://github.com/kyazdani42/nvim-tree.lua/issues/1005#issuecomment-1183468091
-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function()
--         if #vim.api.nvim_list_wins() == 1 and
--         vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
--         modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
--             vim.cmd "quit"
--         end
--     end
-- })
