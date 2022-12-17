local config = require('nvim-treesitter.configs')

config.setup {
    -- List of parsers to install, type `TSInstallInfo` for a list of parsers
    ensure_installed = {
        'fish',
        'python',
        'lua',
    },

    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    },

    indent = {
        enable = true,
        disable = { "python" },
    },

    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",

                ["aP"] = { query = '@parameter.outer', desc = 'a parameter' },
                ["iP"] = { query = '@parameter.inner', desc = 'inner parameter' },

                ["ac"] = { query = "@class.inner", desc = "a class" },
                ["ic"] = { query = "@class.inner", desc = "inner class" },
            },
        },

        swap = {
            enable = true,

            swap_next = {
                ["<leader>lsp"] = { query = '@parameter.inner', desc = 'Swap next parameter' },
            },
            swap_previous = {
                ["<leader>lsP"] = { query = '@parameter.inner', desc = 'Swap previous parameter' },
            },
        },

        move = {
            enable = true,
            set_jumps = true,

            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]p"] = { query = '@parameter.inner', desc = 'Next parameter start' },
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]P"] = { query = '@parameter.inner', desc = 'Next parameter end' },
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[p"] = { query = '@parameter.inner', desc = 'Previous parameter start' },
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[P"] = { query = '@parameter.inner', desc = 'Previous parameter end' },
            },
        },
    }
}