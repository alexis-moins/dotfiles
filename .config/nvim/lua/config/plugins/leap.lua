local plugin = {
    -- Quick navigation
    'ggandor/leap.nvim',
    keys = {
        -- leap
        's', 'S', 'gs',
        { 'x', mode = 'v' },
        { 'X', mode = 'v' },

        -- Flit
        'f', 'F'
    },

    dependencies = {
        'ggandor/flit.nvim',
        { 'alexis/leap-spooky', dev = true }
    }
}

plugin.config = function()
    require('leap').add_default_mappings()

    -- Extensions
    require('flit').setup()
    require('leap-spooky').setup()
end

return plugin
