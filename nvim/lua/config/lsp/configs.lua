local lsp_installer = _SAFE_LOAD_PLUGIN("nvim-lsp-installer")
if not lsp_installer then
	return
end

local lspconfig = require("lspconfig")

-- which servers should be installed
local servers = { "jsonls", "sumneko_lua", "tsserver" }

lsp_installer.setup({
	ensure_installed = servers,
})

-- setup every lsp server 
for _, server in pairs(servers) do
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
	if has_custom_opts then
    -- merge configs when more details are found under settings/ directory
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
