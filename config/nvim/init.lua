-- User configuration for neovim
-- Author: Alexis Moins
-- Creation: 15 feb 2022

-- Set the colorscheme
vim.cmd [[colorscheme depths]]

-- {{{ plugins

-- Config stuff
require('config.packer')
require('config.mappings')
require('config.netrw')

-- Plugin stuff
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.completion')

-- }}}

-- {{{ options

-- Don't change the cursor shape depending on the mode
vim.opt.guicursor = ''

-- Display signs over the line number
vim.opt.signcolumn = 'number'

-- Automatically replace tabulations with spaces
vim.opt.expandtab = true

-- One tab equals 4 spaces
vim.opt.tabstop = 4

-- Use 4 spaces for indentation
vim.opt.shiftwidth = 4

-- Ignore the case during search
vim.opt.ignorecase = true

-- Override 'ignorecase' if the search pattern contains upper case characters
vim.opt.smartcase = true

-- Never wrap lines when they are too long
vim.opt.wrap = true

-- Always display the next 8 lines below or above the cursor 
vim.opt.scrolloff = 5

-- Never pass beyond 120 characters on a line
vim.opt.textwidth = 120

-- Open vertical splits to the right
vim.opt.splitright = true

-- Open horizontal splits below
vim.opt.splitbelow = true 

-- vim.opt.the content of the statusline
vim.opt.statusline = '%2* %t %0*[.] %3*%m%4*%=  %5*%y'

-- Use markers to create folds
vim.opt.foldmethod = 'marker'

-- Only fold 1 time
vim.opt.foldnestmax = 1

-- Use the patience algorithm to show differences, don't take whitespaces into
-- account and completely fold identical parts
vim.opt.diffopt:append({'algorithm:patience', 'iwhiteall', 'context:0'})

-- Highlight the text line of the cursor
vim.opt.cursorline = true

-- Add French to the known languages for spellcheck
vim.opt.spelllang:append('fr')

-- Location of the system dictionary
vim.opt.dictionary = '/usr/share/dict/words'

-- Don't add anything at the end of the folded line
vim.opt.fillchars = 'fold: '

-- Show ¬ at the end of the line
vim.opt.listchars:append('eol:¬')

-- During search, look inside of the current directory and subdirectories
vim.opt.path = '.,**'

-- Never use swapfiles
vim.opt.swapfile = true

-- Save the undotree for each file in the undo-history directory
vim.opt.undofile = true

-- No more startup messages
vim.opt.shortmess:append('Ic')

-- Enables mouse usage in all modes
vim.opt.mouse = 'a'

-- }}}
