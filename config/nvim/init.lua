-- Use 24-bit colors
vim.opt.termguicolors = true

-- Use relative number
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true

-- Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Always use system clipboard
vim.opt.clipboard:append('unnamedplus')

-- Split panes below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Prefere a general persistent undo history
-- over the use of local swap files
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.path = { '.', '**' }

-- Set the content of the statusline
vim.opt.statusline = '%='

-- Set the content of the winbar
vim.opt.winbar = '%=%1*%m %0*%t'

-- Use a global statusline
vim.opt.laststatus = 3

-- Just so that it is beautiful
vim.opt.scrolloff = 5
vim.opt.wrap = false

-- Folds
vim.opt.foldmethod = 'marker'
vim.opt.foldnestmax = 1

-- Tabulation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.shortmess = 'filnxtToOFIc'
vim.opt.diffopt:append({ 'algorithm:patience', 'iwhiteall', 'context:0' })

vim.opt.fillchars = { fold = ' ', eob = ' ' }
vim.opt.listchars = { eol = '¬', tab = '> ', trail = '-', extends = '!', precedes = '!' }

-- Don't show commands below the statusline
vim.opt.showcmd = false

-- Initializing config
require('config')
