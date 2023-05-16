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

map('n', '<leader>=', vim.lsp.buf.format, 'Format this file')

-- Move normally in in wrapped lines
map({ 'n', 'v' }, 'j', 'gj')
map({ 'n', 'v' }, 'k', 'gk')

-- Session management
map('n', '<C-S>', ':mksession!', 'Save current session')

-- Quickfix list
map('n', '<leader>q', vim.cmd.copen, 'Open quickfix list')

-- Stay in place
map('n', 'J', 'mzJ`z', 'Join line below without moving cursor')

-- Use + to increment numbers
map('n', '+', '<C-A>', 'Increment number under cursor')

-- Center
vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Tabs
map('n', '<Tab>', 'gt', 'Previous tab')
map('n', '<S-Tab>', 'gT', 'Next tab')

-- Keep visual selection when indenting
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Move lines around
vim.keymap.set('v', '<C-j>', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<cr>gv=gv")
vim.keymap.set('n', '<C-j>', '<cmd>m .+1<cr>==')
vim.keymap.set('n', '<C-k>', '<cmd>m .-2<cr>==')

vim.keymap.set('n', '<leader>on', ':set number!<cr>', { desc = 'Toggle line number', silent = true })
vim.keymap.set('n', '<leader>ow', ':set wrap!<cr>', { desc = 'Toggle line wrapping', silent = true })
vim.keymap.set('n', '<leader>os', ':set spell!<cr>', { desc = 'Toggle spell checking', silent = true })
