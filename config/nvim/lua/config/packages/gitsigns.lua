-- Git signs in the signcolumn
local git_signs = require('gitsigns')

-- Only provide mappings inside of git repositories
local on_attach = function(_)
    -- Navigate between hunks
    vim.keymap.set('n', '[h', git_signs.prev_hunk)
    vim.keymap.set('n', ']h', git_signs.next_hunk)

    -- Blame the current line(s)
    vim.keymap.set({ 'n', 'v' }, '<leader>gb', git_signs.toggle_current_line_blame)

    -- Custom text-object for hunks
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

-- Global setup
git_signs.setup {

    -- Changing signs
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' }
    },

    -- Lower blame delay (default is 1000)
    current_line_blame_opts = {
        delay = 150,
    },

    -- Execute this function when attaching
    on_attach = on_attach

}
