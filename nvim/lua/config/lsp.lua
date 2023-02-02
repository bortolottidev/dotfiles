local lsp = _SAFE_LOAD_PLUGIN('lsp-zero')
if not lsp then
	return
end

lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
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
  set_lsp_keymaps = { omit = { 'gr' } }
})
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  bind('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
end)

-- Configure lua language server for neovim
-- required to avoid "undefined vim" false warning
lsp.nvim_workspace()

lsp.setup()
