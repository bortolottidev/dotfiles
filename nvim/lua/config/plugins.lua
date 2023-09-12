local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", tag = "v0.1.3" })
	use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and --[[ treesitter ]]
  use({
    'numToStr/Comment.nvim',
    tag = 'v0.8.0',
    config = function()
        require('Comment').setup()
    end,
  })
	use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    commit = "9bff161dfece6ecf3459e6e46ca42e49f9ed939f",
    requires = "nvim-treesitter/nvim-treesitter"
  })

  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    commit = "94c7c810af205c0f00c8f105dcf490c8eb17658a",
  }
	use({ "akinsho/bufferline.nvim", tag = "v4.*", requires = "nvim-tree/nvim-web-devicons" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" })
	use({ "akinsho/toggleterm.nvim", tag = "v2.7.1" })
	use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
	use({ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" })
	use({ "goolord/alpha-nvim", commit = "712dc1dccd4fd515ef8bd126b3718f79d3e23b0d" })
	use({ "folke/which-key.nvim", tag = "v1.*" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", tag = "v2.*" })
  -- "A fancy configurable notification manager"
  use ("rcarriga/nvim-notify")

	-- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- HARPOOOOON
  use {
    "ThePrimeagen/harpoon",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use { "chrisbra/csv.vim" }

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", tag = "v0.9.0", run = ":TSUpdate" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "fef5d90953f0a730483b44745fae5938ba8227f8" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
