
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

-- Configure leap
require('leap').set_default_keymaps()

-- Setup clangd
require("lspconfig").clangd.setup({})

-- Configure mason
require("mason").setup()

