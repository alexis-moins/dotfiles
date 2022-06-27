-- Harpoon
local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

-- Mappings
vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hl', ui.toggle_quick_menu)

-- Navigating between marks
vim.keymap.set('n', '<leader>hh', ui.nav_prev)
vim.keymap.set('n', '<leader>ll', ui.nav_next)
