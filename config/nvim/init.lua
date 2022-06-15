-- Default colorscheme
vim.cmd [[colorscheme embark]]
vim.cmd [[filetype plugin indent on]]

-- Use 24 bit colors
vim.opt.termguicolors = true

-- Use relative number
vim.opt.signcolumn = 'number'
vim.opt.relativenumber = true
vim.opt.number = true

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Prefere a general persistent undo history
-- over the use of local swap files
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.path = {'.', '**'}

-- Set the content of the statusline
vim.opt.statusline = '%=%m [.] %t %y'

-- Just so that it is beautiful
vim.opt.scrolloff = 5
vim.opt.foldnestmax = 1
vim.opt.wrap = false

-- Tabulation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- vim.opt.shortmess:append({'I', 'c'})
vim.opt.diffopt:append({'algorithm:patience', 'iwhiteall', 'context:0'})

-- 
vim.opt.fillchars = { fold = ' ' }
vim.opt.listchars = { eol = '¬', tab = '> ', trail = '!' }
vim.opt.list = true

-- Initializing config
require('config')
