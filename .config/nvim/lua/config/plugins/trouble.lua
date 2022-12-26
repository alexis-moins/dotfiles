local plugin = {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle'
}

plugin.init = function()
    local mapping = require('utils').map
    mapping('n', '<leader>t', vim.cmd.TroubleToggle, 'Open or close Trouble window')

    -- -- Quickfix list
    local opts = { skip_groups = true, jump = true }

    mapping('n', ']q', function() require("trouble").next(opts) end, 'Next Trouble item')
    mapping('n', '[q', function() require("trouble").previous(opts) end, 'Previous Trouble item')
end

plugin.config = {
    icons = false,
    auto_close = true,

    use_diagnostic_signs = true
}

return plugin
