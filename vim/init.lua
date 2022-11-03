local opt = vim.opt
vim.cmd 'source ~/.config/nvim/unconverted.vim'

opt.incsearch = true   -- incremental search
opt.modeline = true    -- allows us to set variables specific to a file in the file
opt.number = true      -- Put numbers on side of file
opt.mouse = 'a'        -- Make the mouse available in all modes
opt.tabstop = 4        -- Tab should show as 4 spaces
opt.ignorecase = true  -- This has to be set for smartcase to work
opt.smartcase = true   -- Search using smart case
opt.lbr = true         -- word wraps on word rather than characters
opt.vb = false         -- Turn off visual bell
opt.guifont= { "DejaVu Sans Mono", ":h12" }

vim.keymap.set('', '<F2>', ':w<CR>')    -- save file with F2

-- For grep search in vim
vim.g.ackprg = 'ag --nogroup --nocolor --column'

-- By default highlighted text is placed in the * register
vim.opt.clipboard:append { 'unnamedplus' }

require('plugins')

-- Config for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Use colorscheme
vim.cmd 'set t_Co=256'
vim.cmd 'set background=dark'
vim.cmd 'colorscheme PaperColor'

-- Python in a conda environment
vim.g.python3_host_prod = '/home/kfrance/miniconda3/envs/vim/bin/python'
