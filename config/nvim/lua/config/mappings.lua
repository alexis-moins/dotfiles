-- Leader key
vim.g.mapleader = ' '

-- Gloabal mappings
vim.keymap.set('n', '<leader>ins', '<cmd>PackerSync<cr>')

-- Keep visual selection when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Move lines around
vim.keymap.set('v', '<C-j>', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<cr>gv=gv")
vim.keymap.set('n', '<C-j>', '<cmd>m .+1<cr>==')
vim.keymap.set('n', '<C-k>', '<cmd>m .-2<cr>==')

-- Netrw
vim.keymap.set('n', '-', '<cmd>15Lex<cr>')
vim.keymap.set('n', '+', '<cmd>15Lex ~<cr>')

-- Options
vim.keymap.set('n', ';nu', '<cmd>setl nu!<cr>')
vim.keymap.set('n', ';rnu', '<cmd>setl rnu!<cr>')
