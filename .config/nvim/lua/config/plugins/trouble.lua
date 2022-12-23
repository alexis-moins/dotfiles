local M = {}

function M.config()
    require('trouble').setup {
        icons = false,
        auto_close = true,

        use_diagnostic_signs = true
    }
end

function M.init()
    vim.keymap.set('n', '<leader>t', vim.cmd.TroubleToggle, { desc = 'Open or close Trouble window' })

    -- -- Quickfix list
    -- vim.keymap.set('n', '[q', vim.cmd.cprevious, { desc = "Previous quickfix item" })

    vim.keymap.set('n', ']q', function() require("trouble").next({ skip_groups = true, jump = true }) end,
        { desc = "Next Trouble item" })

end

return M
