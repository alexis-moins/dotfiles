vim.keymap.set('n', '<leader>so', vim.cmd.source)

vim.keymap.set('i', 'jk', '<C-c>')
vim.keymap.set('n', '<leader>sp', '<cmd>setlocal spell!<cr>', { desc = 'Toggle spell checking' })

vim.keymap.set('n', '<leader>a', 'gg<S-v>G', { desc = "Select all buffer" })

vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "Format file" })

-- Paste and x without yanking text
-- vim.keymap.set('n', 'p', '"_dP', { desc = "Paste text without yanking" })
vim.keymap.set('n', '<leader>x', '"_x')

vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')

vim.keymap.set('n', '[q', vim.cmd.cprevious, { desc = 'Previous quickfix item' })
vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next quickfix item' })

vim.keymap.set('n', '<leader>q', vim.cmd.copen, { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>Q', vim.cmd.cclose, { desc = 'Close quickfix list' })

-- Stay in place
vim.keymap.set('n', 'J', 'mzJ`z')

-- Use + to increment numbers
vim.keymap.set('n', '+', '<C-A>')
vim.keymap.set('n', '-', '<C-X>')

-- Center
vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Tabs
vim.keymap.set('n', '<Tab>', 'gt', { desc = "Previous tab" })
vim.keymap.set('n', "<S-Tab>", 'gT', { desc = "Next tab" })

-- Keep visual selection when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Move lines around
vim.keymap.set('v', '<C-j>', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<cr>gv=gv")
vim.keymap.set('n', '<C-j>', '<cmd>m .+1<cr>==')
vim.keymap.set('n', '<C-k>', '<cmd>m .-2<cr>==')

vim.keymap.set('n', '<leader>ss', '<cmd>mksession!<cr>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>sr', '<cmd>source Session.vim<cr>', { desc = 'Restore session' })

vim.keymap.set('n', '<leader>on', ':set number!<cr>', { desc = 'Toggle line number', silent = true })
vim.keymap.set('n', '<leader>ow', ':set wrap!<cr>', { desc = 'Toggle line wrapping', silent = true })
vim.keymap.set('n', '<leader>os', ':set spell!<cr>', { desc = 'Toggle spell checking', silent = true })
