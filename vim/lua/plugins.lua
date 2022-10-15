
-- Setup packer
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'     -- Package manager
  use 'mhinz/vim-startify'         -- Fancy startup page
  use 'ggandor/leap.nvim'          -- Motion plugin
  use 'williamboman/mason.nvim'    -- Manage  LSP servers
  use 'tpope/vim-commentary'       -- Comment code out
end)

-- Configure leap
require('leap').set_default_keymaps()


-- Configure mason
require("mason").setup()
