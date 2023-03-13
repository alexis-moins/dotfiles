local plugin = {
    'folke/which-key.nvim',
    event = 'VeryLazy'
}

plugin.config = function()
    require('which-key').setup {
        plugins = {
            spelling = {
                enabled = true,
            },
        },

        window = {
            border = 'rounded'
        }
    }

end

return plugin
