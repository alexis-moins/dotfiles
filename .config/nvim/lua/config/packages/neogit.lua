local neogit = require('neogit')

neogit.setup {
    -- Signs are obstrusive
    disable_signs = true,

    -- Don't display hints on top of the buffer
    disable_hint = true,

    -- No more hideous context highlighting
    disable_context_highlighting = true,

    -- No confirmation after commits
    disable_commit_confirmation = true,

    -- No notifications either
    disable_builtin_notifications = true,
}

-- Open neo[g]it status tab
vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open neogit status' })
