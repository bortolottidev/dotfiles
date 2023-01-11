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

-- Configure lua language server for neovim
-- required to avoid "undefined vim" false warning
lsp.nvim_workspace()

lsp.setup()
