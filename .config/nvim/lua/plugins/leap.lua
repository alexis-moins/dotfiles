return {
    -- Quick navigation
    'ggandor/leap.nvim',
    keys = {
        -- leap
        's', 'S', 'gs',
        { 'x', mode = 'v' },
        { 'X', mode = 'v' },
    },

    config = function()
        require('leap').add_default_mappings()
    end
}
