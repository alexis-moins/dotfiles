local config = require [[nvim-treesitter.configs]]

config.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "python", "lua" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    }
}
