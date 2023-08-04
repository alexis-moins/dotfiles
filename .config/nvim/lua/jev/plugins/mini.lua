return {

    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = true }
        },
    },

    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            options = { ignore_blank_line = true },
        },
    },

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

    {
        "echasnovski/mini.move",
        event = "VeryLazy",
        opts = {
            mappings = {
                -- Normal mode
                down = '<C-J>',
                up = '<C-K>',
                left = '<C-H>',
                right = '<C-L>',

                -- Visual node
                line_down = '<C-J>',
                line_up = '<C-K>',
                line_left = '<C-H>',
                line_right = '<C-L>',
            }
        }
    },

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
            treesitter = { suffix = '' },
            oldfile = { suffix = '' },
        }
    },

    {
        "echasnovski/mini.jump",
        event = "VeryLazy",
        opts = {
            mappings = {
                repeat_jump = ','
            },

            delay = {
                highlight = 0
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
        "echasnovski/mini.files",
        event = 'BufEnter',
        opts = {
            mappings = {
                go_in = 'L',
                go_in_plus = '<CR>',

                go_out = 'H',
                go_out_plus = ''
            }
        },

        keys = {
            { '-', function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end, desc = 'Open file explorer' },
        }

    },

    -- {
    --     "echasnovski/mini.clue",
    --     event = 'VeryLazy',
    --     opts = {
    --         triggers = {
    --             { mode = 'n', keys = '<Leader>' },
    --             { mode = 'n', keys = '[' },
    --             { mode = 'n', keys = ']' },
    --         },

    --         clues = {
    --             { mode = 'n', keys = ']d',        postkeys = ']' },
    --             { mode = 'n', keys = '[d',        postkeys = '[' },

    --             { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
    --             { mode = 'n', keys = '<Leader>f', desc = '+Find' },
    --             { mode = 'n', keys = '<Leader>m', desc = '+Move' },
    --         },

    --         window = {
    --             delay = 300
    --         }
    --     },
    -- },

}
