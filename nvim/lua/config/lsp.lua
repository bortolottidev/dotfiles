local lsp = _SAFE_LOAD_PLUGIN('lsp-zero')
local null_ls = require('null-ls')
if not lsp then
  return
end
if not null_ls then
  return
end

lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
})

vim.diagnostic.config({
  virtual_text = false, -- display warn without tap on diagnostic
  signs = true, -- display flags
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    prefix = '',
    header = '',
  },
})

-- Custom <leader>gr keymaps
lsp.set_preferences({
  set_lsp_keymaps = { omit = { 'gr', 'gd' } }
})
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  local bind = vim.keymap.set

  bind('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  bind('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
end)

-- Configure lua language server for neovim
-- required to avoid "undefined vim" false warning
lsp.nvim_workspace()

lsp.setup()

-- Configure null ls in order to add standardjs auto formatter (@see autommands.lua)
null_ls.setup({
  sources = {
    --[[ null_ls.builtins.diagnostics.standardjs.with({ ]]
    --[[   filetype = { "javascript", "javascriptreact" } ]]
    --[[ }), ]]
    --[[ null_ls.builtins.formatting.standardjs.with({ ]]
    --[[   filetype = { "javascript", "javascriptreact" } ]]
    --[[ }), ]]
  },
})
