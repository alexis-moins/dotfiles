-- Map leader to space
vim.g.mapleader = " "

-- 
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>') 
vim.keymap.set('n', ']b', '<cmd>bnext<cr>')

vim.keymap.set('n', '<leader>cs', '<cmd>mks! .vim-session<cr>')
vim.keymap.set('n', '<leader>ss', '<cmd>so .vim-session<cr>')

-- Source the current file
vim.keymap.set('n', '<leader>src', '<cmd>source %<cr>')

-- Indent the current file
vim.keymap.set('n', '<leader>ind', 'magg=G`a')

-- Kepp visual selection when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Moves line around in visual mode
vim.keymap.set('v', '<C-j>', '<cmd>m \'>+1<cr>gv=gv')
vim.keymap.set('v', '<C-k>', '<cmd>m \'<-2<cr>gv=gv')

-- Move line around in normal mode
vim.keymap.set('n', '<C-j>', '<cmd>m .+1<cr>==')
vim.keymap.set('n', '<C-k>', '<cmd>m .-2<cr>==')

-- Keep position after visually yanking 
vim.keymap.set('v', 'y', 'mpy`p')
vim.keymap.set('v', 'Y', 'mpY`p')

-- Navigates between splits more easily
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- Selects the first match in the spelling list
vim.keymap.set('n', '<C-s>', 'mp[s1z=`p')

-- See treesitter type under cursor (nvim-treesitter/playground)
vim.keymap.set('n', '<leader>syn', '<cmd>TSHighlightCapturesUnderCursor<cr>')

-- inoremap <C-s> <C-c>[s1z=`]a

-- iabbrev <expr> tdd strftime("%d %b %Y")

