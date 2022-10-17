local lsp = _SAFE_LOAD_PLUGIN("lspconfig")
if not lsp then
	return
end

require "config.lsp.configs"
require("config.lsp.handlers").setup()
require "config.lsp.null-ls"
