-- Leader key
vim.g.mapleader = ' '

-- Gloabal mappings
vim.keymap.set('n', '<leader>ins', '<cmd>PackerSync<cr>')
vim.keymap.set('n', '<leader>pack', '<cmd>Mason<cr>')
vim.keymap.set('n', '<leader>lsp', '<cmd>LspInfo<cr>')
vim.keymap.set('n', '<leader>so', '<cmd>source %<cr>')
vim.keymap.set('i', 'jk', '<C-c>')

-- Quickfix list
vim.keymap.set('n', '[q', '<cmd>cprevious<cr>')
vim.keymap.set('n', ']q', '<cmd>cnext<cr>')

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

-- Options
vim.keymap.set('n', ';ls', '<cmd>set list!<cr>')
vim.keymap.set('n', ';nu', '<cmd>set number!<cr>')
vim.keymap.set('n', ';rnu', '<cmd>set relativenumber!<cr>')
