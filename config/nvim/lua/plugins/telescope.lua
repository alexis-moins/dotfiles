-- Telescope
local telescope = require('telescope')

-- Loading fzf sorter
telescope.load_extension('fzf')

-- Mappings
vim.keymap.set('n', '<leader>/k', '<cmd>Telescope keymaps<CR>')
vim.keymap.set('n', '<leader>/:', '<cmd>Telescope commands<CR>')
vim.keymap.set('n', '<leader>/g', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>/f', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>/h', '<cmd>Telescope command_history<CR>')
vim.keymap.set('n', '<C-_>', '<cmd>Telescope current_buffer_fuzzy_find<CR>') -- Mapped to C-/

-- Git
vim.keymap.set('n', '<leader>/F', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>/c', '<cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>/C', '<cmd>Telescope git_bcommits<CR>')
vim.keymap.set('n', '<leader>/b', '<cmd>Telescope git_branches<CR>')
