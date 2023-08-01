-- Use 24-bit colors
vim.opt.termguicolors = true

-- Never display signs
vim.opt.signcolumn    = 'yes'
vim.opt.cursorline    = true

-- Enable mouse support in all modes
vim.opt.mouse         = 'a'
vim.opt.switchbuf     = 'usetab'

-- Split panes below and to the right
vim.opt.splitbelow    = true
vim.opt.splitright    = true

-- Prefer a general persistent undo history
-- over the use of local swap files
vim.opt.undofile      = true
vim.opt.swapfile      = false

-- Never display the statusline
vim.opt.ruler         = true
vim.opt.laststatus    = 3
vim.opt.cmdheight     = 0
vim.opt.showmode      = false
vim.opt.showcmd       = false

-- Never wrap lines
vim.opt.wrap          = false

-- Keep 8 lines above and below the cursor
vim.opt.scrolloff     = 8

-- Keep 8 lines before and after the cursor
vim.opt.sidescrolloff = 8

vim.opt.linebreak     = true -- When wrapping lines, break at word boundaries
vim.opt.breakindent   = true -- Keep indent when breaking lines

vim.opt.spelllang     = 'en,fr'

-- Folds
vim.opt.foldlevel     = 1
vim.opt.foldnestmax   = 10
vim.opt.foldmethod    = 'indent'
vim.opt.foldenable    = false

-- Tabulation
vim.opt.tabstop       = 4
vim.opt.shiftwidth    = 4
vim.opt.expandtab     = true

-- Search
vim.opt.smartcase     = true
vim.opt.ignorecase    = true

-- No intro message, less command line messages
vim.opt.shortmess:append('WIcS')

--
vim.opt.formatoptions = 'qjl1'

vim.opt.diffopt:append({ 'algorithm:patience', 'iwhiteall', 'context:0' })

vim.opt.fillchars = 'fold: ,eob: ,diff:╱'

vim.opt.listchars = { tab = '› ', trail = '—', extends = '…', precedes = '…', eol = '↴', nbsp = '␣' }

vim.opt.list = true

vim.opt.showtabline = 1

vim.opt.winbar = "%=%#Error#%m %#Conceal#%.30f"

vim.opt.timeout = false -- Wait indefinitely for mappings

-- Show which-key menu faster
vim.opt.timeoutlen = 300

-- Leaders for mappings
vim.g.mapleader = ' '

-- Local leader for plugin mappings
vim.g.maplocalleader = ';'
