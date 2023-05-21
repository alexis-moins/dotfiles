local utils = require('jev.utils')
local map = utils.map

-- Easier way to leave insert mode
map('i', 'jk', '<C-C>')

-- Clear search highlighting
map('n', '<CR>', '<cmd>nohlsearch<CR>', 'Clear search highlighting')

-- Add newlines below and above
map('n', '[<space>', 'mzO<esc>`z', 'Insert a line above cursor')
map('n', ']<space>', 'mzo<esc>`z', 'Insert a line below cursor')

map('n', '=', vim.lsp.buf.format, 'Format file')
map('n', '<leader>so', vim.cmd.source, 'Source file')

-- Move normally in in wrapped lines
map({ 'n', 'v' }, 'j', 'gj')
map({ 'n', 'v' }, 'k', 'gk')

map('n', '<C-S>', '<cmd>mksession!<cr>', 'Save current session')
-- Session management

-- Stay in place
map('n', 'J', 'mzJ`z', 'Join line below without moving cursor')

-- Easier line navigation
map('n', 'L', '$', 'Go to the end of the line')

-- Use + to increment numbers
map('n', '+', '<C-A>', 'Increment number under cursor')

-- Center
map('n', '<C-U>', '<C-U>zz', 'Scroll upwards (center)')
map('n', '<C-D>', '<C-D>zz', 'Scroll downwards (center)')

map('n', 'n', 'nzz', 'Repeat last search (center)')
map('n', 'N', 'Nzz', 'Repeat last search in opposite direction (center)')

-- Tabs
map('n', '<Tab>', '<cmd>tabnext<cr>', 'Previous tab')
map('n', '<S-Tab>', '<cmd>tabprevious<cr>', 'Next tab')

-- Option toggling
map('n', '|n', '<cmd>setl number!<cr>', 'Toggle line number')
map('n', '|r', '<cmd>setl relativenumber!<cr>', 'Toggle relative line number')

map('n', '|c', '<cmd>setl cursorline!<cr>', 'Toggle cursorline')
map('n', '|l', '<cmd>setl list! list?<cr>', 'Toggle list chararcters')

map('n', '|w', '<cmd>setl wrap! wrap?<cr>', 'Toggle line wrapping')
map('n', '|s', '<cmd>setl spell! spell?<cr>', 'Toggle spell checking')

-- Copy using + register
map({ 'n', 'x' }, 'gy', '"+y', 'Copy (+register)')

-- Paste using + register
map('n', 'gp', '"+p', 'Paste after cursor (+register)')
map('n', 'gP', '"+P', 'Paste before cursor (+register)')
