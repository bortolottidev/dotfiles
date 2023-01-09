require "utils"

-- vim options
require "config.options"

-- remapping 
require "config.keymaps"

-- load plugins
require "config.plugins"

-- notification manager for error and warnings
require "config.notify"

-- theme
require "config.colorscheme"

-- plugins config
-- core plugins
require "config.cmp"

local lsp = require('lsp-zero')
lsp.preset('recommended')
vim.diagnostic.config({
  virtual_text = false, -- display warn without tap on diagnostic
  signs = true, -- required to display flag
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
-- lsp.configure('sumneko_lua', {
--   settings = {
--     diagnostic = {
--       globals = { 'vim' }
--     }
--   }
-- })
lsp.setup()

require "config.telescope"
require "config.treesitter"
require "config.autopairs"
require "config.comment"
require "config.gitsigns"
require "config.nvim-tree"
require "config.bufferline"
require "config.lualine"
require "config.toggleterm"
require "config.project"
require "config.impatient"
require "config.indentline"
require "config.alpha"
require "config.whichkey"
require "config.autocommands"
require "config.harpoon"

-- test plugins
