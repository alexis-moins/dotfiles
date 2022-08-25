local config = require('nvim-treesitter.configs')

config.setup {
    -- List of parsers to install, type `TSInstallInfo` for a list of parsers
    ensure_installed = {
        -- scripting
        'fish',
        -- back-end developpment
        'python', 'lua', 'go',
        -- front-end developpment
        'html', 'javascript', 'css', 'vue',
    },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    },
}
