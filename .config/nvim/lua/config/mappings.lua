-- Leader key
vim.g.mapleader = ' '

local keymap = function(modes, keys, command, desc)
    vim.keymap.set(modes, keys, command, { silent = true, desc = desc })
end

-- Gloabal mappings
vim.keymap.set('n', '<leader>ins', '<cmd>PackerSync<cr>')
vim.keymap.set('n', '<leader>lm', '<cmd>Mason<cr>', { desc = "Open Mason popup" })
vim.keymap.set("n", '<leader>li', '<cmd>LspInfo<cr>', { desc = "Show LSP client information" })
vim.keymap.set('n', '<leader>so', '<cmd>source %<cr>')

vim.keymap.set('i', 'jk', '<C-c>')

vim.keymap.set('n', '<leader>a', 'gg<S-v>G', { desc = "Select all buffer" })

-- Paste and x without yanking text
vim.keymap.set('x', '<leader>p', '"_dP', { desc = "Paste text without yanking" })
vim.keymap.set('n', '<leader>x', '"_x')

vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '<C-D>', '<C-D>zz')

-- Quickfix list
vim.keymap.set('n', '[q', '<cmd>cprevious<cr>', { desc = "Previous quickfix item" })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = "Next quickfix item" })

-- Tabs
vim.keymap.set('n', '[t', '<cmd>tabprevious<cr>', { desc = "Previous tab" })
vim.keymap.set('n', ']t', '<cmd>tabnext<cr>', { desc = "Next tab" })

-- Keep visual selection when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Zoom a window with Ctrl-z
vim.keymap.set('n', '<C-w>z', '<C-w>|')

-- Move lines around
vim.keymap.set('v', '<C-j>', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<cr>gv=gv")
vim.keymap.set('n', '<C-j>', '<cmd>m .+1<cr>==')
vim.keymap.set('n', '<C-k>', '<cmd>m .-2<cr>==')

keymap('n', 'n', 'nzz')
keymap('n', 'N', 'Nzz')

vim.keymap.set('n', '<leader>ss', '<cmd>mksession!<cr>')
vim.keymap.set('n', '<leader>sr', '<cmd>source Session.vim<cr>')
