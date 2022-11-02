
-- Setup packer
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'     -- Package manager
  use 'mhinz/vim-startify'         -- Fancy startup page
  use 'ggandor/leap.nvim'          -- Motion plugin
  use 'williamboman/mason.nvim'    -- Manage  LSP servers
  use 'tpope/vim-commentary'       -- Comment code out
  use 'ibhagwan/smartyank.nvim'    -- Copy over ssh
  use 'neovim/nvim-lspconfig'
  use {
		  'nvim-telescope/telescope.nvim', branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'lukas-reineke/indent-blankline.nvim' -- Show a line to indicate indention

  -- Color schemes
  use 'dhruvasagar/vim-railscasts-theme'
  use 'NLKNguyen/papercolor-theme'

  -- Completion Engine
  use { "onsails/lspkind-nvim", event = "VimEnter" }
  use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }
  -- nvim-cmp completion sources
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
  use { "hrsh7th/cmp-vsnip", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use { "hrsh7th/vim-vsnip", after = "nvim-cmp" }
end)

-- Setup clangd
require("lspconfig").clangd.setup({})

-- Configure leap
require('leap').set_default_keymaps()
require('leap').opts.safe_labels = {}

-- Configure mason
require("mason").setup()

