return {

    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = true }
        },
    },

    -- {
    --     "echasnovski/mini.comment",
    --     event = "VeryLazy",
    --     opts = {
    --         options = { ignore_blank_line = true },
    --     },
    -- },

    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {
            custom_surroundings = {
                ["b"] = { output = { left = "(", right = ")" } },
                ["B"] = { output = { left = "{", right = "}" } },
                ["r"] = { output = { left = "[", right = "]" } },
            },
            silent = true,
        },
    },

    -- {
    --     "echasnovski/mini.move",
    --     event = "VeryLazy",
    --     opts = {
    --         mappings = {
    --             -- Normal mode
    --             down = '<C-J>',
    --             up = '<C-K>',
    --             left = '<leader><',
    --             right = '<leader>>',
    --
    --             -- Visual node
    --             line_down = '<C-J>',
    --             line_up = '<C-K>',
    --             line_left = '<',
    --             line_right = '>',
    --         }
    --     }
    -- },

    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = {
            silent = true
        },
    },

    {
        "echasnovski/mini.bracketed",
        event = "VeryLazy",
        opts = {
            location = { suffix = '' },
            treesitter = { suffix = '' },
            oldfile = { suffix = '' },
        }
    },

    {
        "echasnovski/mini.jump",
        event = "VeryLazy",
        opts = {
            delay = {
                highlight = 50
            }
        }
    },

    {
        "echasnovski/mini.splitjoin",
        keys = { 'gs' },
        opts = {
            mappings = {
                toggle = 'gs'
            }
        }
    },

    {
        "echasnovski/mini.bufremove",
        event = "VeryLazy",
        opts = {},

        keys = {
            { '<leader>dd', function() require('mini.bufremove').delete() end }
        }
    },

    -- {
    --     "echasnovski/mini.completion",
    --     opts = {
    --         window = {
    --             info = { height = 25, width = 80, border = 'rounded' },
    --             signature = { height = 25, width = 80, border = 'rounded' }
    --         },
    --
    --         mappings = {
    --             force_twostep = '<C-H>'
    --         }
    --     }
    -- }

    {
        "echasnovski/mini.hipatterns",
        opts = {
            highlighters = {
                -- fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'DiagnosticError' },
                -- hack  = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                -- todo  = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                -- note  = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'DiagnosticHint' },
            }
        },

        config = function(_, opts)
            local hipatterns = require('mini.hipatterns')
            opts.highlighters.hex_color = hipatterns.gen_highlighter.hex_color()

            hipatterns.setup(opts)
        end
    }

}
