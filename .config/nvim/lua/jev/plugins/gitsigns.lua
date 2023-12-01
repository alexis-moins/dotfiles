return {
    -- Gitsigns
    'lewis6991/gitsigns.nvim',
    event = 'BufWinEnter',

    config = function()

        local git_signs = require('gitsigns')
        local keymaps = require("jev.core.keymaps")

        local map = keymaps["map-local"]

        local on_attach = function()
            map('n', '[h', git_signs.prev_hunk, 'Previous git hunk')
            map('n', ']h', git_signs.next_hunk, 'Next git hunk')
        end

        git_signs.setup {
            signs = {
                add = { text = '▍' },
                change = { text = '▍' },
                delete = { text = '▍' },
                topdelete = { text = '▍' },
                changedelete = { text = '▍' },
                untracked = { text = '' },
            },

            current_line_blame_opts = {
                delay = 150,
            },

            on_attach = on_attach
        }
    end
}
