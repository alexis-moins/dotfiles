local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')

-- Tell [h]arpoon to [a]dd the current file
vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file)

-- Tell [h]arpoon to [s]how the menu
vim.keymap.set('n', '<leader>hs', harpoon_ui.toggle_quick_menu)

-- [h]arpoon navigate to the [n]ext mark
vim.keymap.set('n', '<leader>hl', harpoon_ui.nav_next)

-- [h]arpoon navigate to the [p]revious mark
vim.keymap.set('n', '<leader>hh', harpoon_ui.nav_prev)
