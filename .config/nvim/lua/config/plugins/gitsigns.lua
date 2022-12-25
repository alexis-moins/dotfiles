local plugin = {
    -- Gitsigns
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
}

plugin.config = function()

    local git_signs = require('gitsigns')
    local mapping = require('utils').mapping

    local on_attach = function(buffer)
        -- Navigate between hunks
        mapping('n', '[h', git_signs.prev_hunk, 'Previous git hunk', buffer)
        mapping('n', ']h', git_signs.next_hunk, 'Next git hunk', buffer)

        -- Blame the current line(s)
        vim.keymap.set({ 'n', 'v' }, '<leader>gb', git_signs.toggle_current_line_blame,
            { desc = "Blame current line" })
        vim.keymap.set('n', '<leader>gd', git_signs.diffthis, { desc = "Diff current buffer" })

        -- Stage entire buffer
        vim.keymap.set('n', '<leader>ga', git_signs.stage_buffer, { desc = "Stage buffer" })
        vim.keymap.set('n', '<leader>gS', git_signs.reset_buffer, { desc = "Reset buffer" })
    end

    git_signs.setup {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '' },
        },

        current_line_blame_opts = {
            delay = 150,
        },

        on_attach = on_attach
    }
end

return plugin
