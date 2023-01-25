vim.keymap.set('n', '<leader>so', vim.cmd.source)

vim.keymap.set('i', 'jk', '<C-c>')
vim.keymap.set('n', '<leader>sp', '<cmd>setlocal spell!<cr>', { desc = 'Toggle spell checking' })

vim.keymap.set('n', '<leader>a', 'gg<S-v>G', { desc = "Select all buffer" })

-- Paste and x without yanking text
-- vim.keymap.set('n', 'p', '"_dP', { desc = "Paste text without yanking" })
vim.keymap.set('n', '<leader>x', '"_x')

vim.keymap.set({'n', 'v'}, 'j', 'gj')
vim.keymap.set({'n', 'v'}, 'k', 'gk')

vim.keymap.set('n', '<leader>ldn', vim.diagnostic.goto_next, { desc = 'Next diagnostic'})
vim.keymap.set('n', '<leader>ldp', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic'})

-- Stay in place
vim.keymap.set('n', 'J', 'mzJ`z')

-- Center
vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Tabs
vim.keymap.set('n', '[t', vim.cmd.tabprevious, { desc = "Previous tab" })
vim.keymap.set('n', ']t', vim.cmd.tabnext, { desc = "Next tab" })

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

vim.keymap.set('n', '<leader>ss', '<cmd>mksession!<cr>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>sr', '<cmd>source Session.vim<cr>', { desc = 'Restore session' })
