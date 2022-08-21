local config = require('nvim-treesitter.configs')

config.setup {
    -- List of parsers to install, type `TSInstallInfo` for a list of parsers
    ensure_installed = {
        'fish',
        'python',
        'lua',
        'go',
        'html',
        'javascript',
        'vue'
    },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    },

    -- indent = {
    --     enable = true,
    --
    --     disable = { 'python' }
    -- }
}
