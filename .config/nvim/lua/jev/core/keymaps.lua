local map = require('jev.utils').map

-- Easier way to leave insert mode
map('i', 'jk', '<C-C>')

map('n', '<Leader>q', vim.cmd.copen, 'Open quickfix list')
map('n', '<Leader>x', vim.cmd.lopen, 'Open location list')

map('n', '<Leader>bd', '<cmd>bdelete<cr>', 'Delete the current buffer')

-- map('n', '[x', vim.cmd.lprevious, 'Previous localtion list item')
-- map('n', ']x', vim.cmd.lnext, 'Next location list item')

-- Clear search highlighting
map('n', '<CR>', '<cmd>nohlsearch<cr><cr>', 'Clear search highlighting')

-- Add newlines below and above
map('n', '[<Space>', 'mzO<esc>`z', 'Insert a line above cursor')
map('n', ']<Space>', 'mzo<esc>`z', 'Insert a line below cursor')

map('n', '=', vim.lsp.buf.format, 'Format file')
map('n', '<Leader>so', vim.cmd.source, 'Source file')

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
map('n', '<Leader><Tab>', '<cmd>tabnext<cr>', 'Previous tab')
map('n', '<Leader><S-Tab>', '<cmd>tabprevious<cr>', 'Next tab')

-- Option toggling
map('n', '|n', '<cmd>set number!<cr>', 'Toggle line number')
map('n', '|r', '<cmd>set relativenumber!<cr>', 'Toggle relative line number')

map('n', '|c', '<cmd>set cursorline!<cr>', 'Toggle cursorline')
map('n', '|l', '<cmd>set list! list?<cr>', 'Toggle list chararcters')

map('n', '|w', '<cmd>setl wrap! wrap?<cr>', 'Toggle line wrapping')
map('n', '|s', '<cmd>setl spell! spell?<cr>', 'Toggle spell checking')

-- Copy using + register
map({ 'n', 'x' }, 'gy', '"+y', 'Copy (+register)')

-- Paste using + register
map({ 'n', 'x' }, 'gp', '"+p', 'Paste after cursor (+register)')
map({ 'n', 'x' }, 'gP', '"+P', 'Paste before cursor (+register)')

map('n', '<Leader>ts', '<cmd>horizontal terminal<cr>', 'Open a terminal in a split')
