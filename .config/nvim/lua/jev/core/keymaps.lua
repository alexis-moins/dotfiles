local map = function(mode, lhs, rhs, description)
    vim.keymap.set(mode, lhs, rhs, {
        desc = description or '',
        silent = true
    })
end

-- Easier way to leave insert mode
map('i', 'jk', '<C-c>')

-- Add newlines below and above
map('n', '[<space>', 'O<esc>j', 'Insert a line above cursor')
map('n', ']<space>', 'o<esc>k', 'Insert a line below cursor')

map('n', '=', vim.lsp.buf.format, 'Format this file')

-- Move normally in in wrapped lines
map({ 'n', 'v' }, 'j', 'gj')
map({ 'n', 'v' }, 'k', 'gk')

-- Session management
map('n', '<C-S>', ':mksession!<cr>', 'Save current session')

-- Stay in place
map('n', 'J', 'mzJ`z', 'Join line below without moving cursor')

-- Use + to increment numbers
map('n', '+', '<C-A>', 'Increment number under cursor')

-- Center
map('n', '<C-U>', '<C-U>zz', 'Scroll upwards (center)')
map('n', '<C-D>', '<C-D>zz', 'Scroll downwards (center)')

map('n', 'n', 'nzz', 'Repeat last search (center)')
map('n', 'N', 'Nzz', 'Repeat last search in opposite direction (center)')

-- Tabs
map('n', '<Tab>', ':tabnext<cr>', 'Previous tab')
map('n', '<S-Tab>', ':tabprevious<cr>', 'Next tab')

-- Keep visual selection when indenting
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Move lines around
vim.keymap.set('v', '<C-j>', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<cr>gv=gv")
vim.keymap.set('n', '<C-j>', '<cmd>m .+1<cr>==')
vim.keymap.set('n', '<C-k>', '<cmd>m .-2<cr>==')

-- Option toggling
map('n', '|n', ':setl number!<cr>', 'Toggle line number')
map('n', '|r', ':setl relativenumber!<cr>', 'Toggle relative line number')

map('n', '|w', ':setl wrap!<cr>', 'Toggle line wrapping')
map('n', '|s', ':setl spell!<cr>', 'Toggle spell checking')

-- Copy using + register
map({ 'n', 'x' }, 'gy', '"+y', 'Copy (+register)')

-- Paste using + register
map('n', 'gp', '"+p', 'Paste after cursor (+register)')
map('n', 'gP', '"+P', 'Paste before cursor (+register)')
