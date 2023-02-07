-- Use 24-bit colors
vim.opt.termguicolors = true

-- Never display signs
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true

-- Enable mouse support in all modes
vim.opt.mouse = 'a'
vim.opt.conceallevel = 3

-- Add line number
vim.opt.number = true

-- Always use system clipboard
vim.opt.clipboard:append('unnamedplus')

-- Split panes below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Prefer a general persistent undo history
-- over the use of local swap files
vim.opt.undofile = true
vim.opt.swapfile = false

-- Never display the statusline
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showmode = false

-- Just so that it is beautiful
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.linebreak = true
vim.opt.spelllang = { 'en', 'fr' }

-- Folds
vim.opt.foldlevel = 2
vim.opt.foldnestmax = 10
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false

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
vim.opt.listchars = { tab = '  ', trail = '-', extends = '>', precedes = '<' }
vim.opt.list = true

-- Don't show commands below the statusline
vim.opt.showcmd = false
vim.opt.showtabline = 1

vim.opt.laststatus = 3
vim.opt.cmdheight = 0

vim.opt.winbar = "%= %#Type#%{get(b:,'gitsigns_status','')} %#Error#%m %#Conceal#%.30f"

-- Show which-key menu faster
vim.opt.timeoutlen = 200
vim.opt.updatetime = 200

-- Leading for mappings
vim.g.mapleader = ' '
