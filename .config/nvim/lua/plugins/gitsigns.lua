local plugin = {
    -- Gitsigns
    'lewis6991/gitsigns.nvim',
    event = 'BufWinEnter',
}

plugin.config = function()

    local git_signs = require('gitsigns')
    local mapping = require('utils').map

    local on_attach = function(buffer)
        -- Navigate between hunks
        mapping('n', '[h', git_signs.prev_hunk, 'Previous git hunk', buffer)
        mapping('n', ']h', git_signs.next_hunk, 'Next git hunk', buffer)

        -- Blame the current line(s)
        mapping({ 'n', 'v' }, '<leader>gb', git_signs.toggle_current_line_blame, 'Blame current line')
        mapping('n', '<leader>gd', git_signs.diffthis, 'Diff current buffer')

        -- Stage entire buffer
        mapping('n', '<leader>ga', git_signs.stage_buffer, 'Stage buffer')
        mapping('n', '<leader>gS', git_signs.reset_buffer, 'Reset buffer')
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

        status_formatter = function(status)
            local added, changed, removed = status.added, status.changed, status.removed
            local status_txt = {}
            if added and added > 0 then table.insert(status_txt, '+' .. added) end
            if changed and changed > 0 then table.insert(status_txt, '~' .. changed) end
            if removed and removed > 0 then table.insert(status_txt, '-' .. removed) end
            return table.concat(status_txt, ' ')
        end,


        on_attach = on_attach
    }
end

return plugin
