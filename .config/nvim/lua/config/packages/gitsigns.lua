-- Git signs in the signcolumn
local git_signs = require('gitsigns')

-- Only provide mappings inside of git repositories
local on_attach = function(_)
    -- Navigate between hunks
    vim.keymap.set('n', '[h', git_signs.prev_hunk, { desc = "Previous git hunk" })
    vim.keymap.set('n', ']h', git_signs.next_hunk, { desc = "Next git hunk" })

    -- Blame the current line(s)
    vim.keymap.set({ 'n', 'v' }, '<leader>gb', git_signs.toggle_current_line_blame, { desc = "Blame current line" })
    vim.keymap.set('n', '<leader>gd', git_signs.diffthis, { desc = "Diff current buffer" })

    -- Stage entire buffer
    vim.keymap.set('n', '<leader>ga', git_signs.stage_buffer, { desc = "Stage buffer" })
    vim.keymap.set('n', '<leader>gS', git_signs.reset_buffer, { desc = "Reset buffer" })

    vim.opt_local.winbar = '%=%#Directory#%{b:gitsigns_status} %#Type#%m %0*%t'
end

-- Global setup
git_signs.setup {

    -- Changing signs
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '' },
    },

    -- Lower blame delay (default is 1000)
    current_line_blame_opts = {
        delay = 150,
    },

    -- Execute this function when attaching
    on_attach = on_attach

}
