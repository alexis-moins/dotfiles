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

    local link = require('utils').link

    link('WhichKeyDesc', 'String')
    link('WhichKeyFloat', 'Normal')
    link('WhichKeyBorder', 'Normal')
end

return plugin
