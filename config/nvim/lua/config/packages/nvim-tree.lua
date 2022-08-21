local api = require 'nvim-tree.api'
local nvim_tree = require 'nvim-tree'

nvim_tree.setup {

    renderer = {

        icons = {

            -- webdev_colors = false,

            -- -- Never display icons for files, folders and git
            -- show = {
            --     file = false,
            --     folder = false,
            --     git = false
            -- },
        }

    },

    diagnostics = {

        enable = true,
        show_on_dirs = true,

        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        },
    },


}

-- Custom mappings
vim.keymap.set('n', '<leader>t', api.tree.toggle)
