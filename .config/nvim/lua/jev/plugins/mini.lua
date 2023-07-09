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
                left = '',
                right = '',

                -- Visual node
                line_down = '<C-J>',
                line_up = '<C-K>',
                line_left = '',
                line_right = '',
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
            location = { suffix = '' },
            treesitter = { suffix = '' },
            oldfile = { suffix = '' },
        }
    },

    {
        "echasnovski/mini.jump",
        event = "VeryLazy",
        opts = {
            mappings = {
                repeat_jump = ''
            },

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
        opts = {},

        config = function()
            require('mini.files').setup()

            local map_split = function(buf_id, lhs, direction)
                local rhs = function()
                    -- Make new window and set it as target
                    local new_target_window
                    vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
                        vim.cmd(direction .. ' split')
                        new_target_window = vim.api.nvim_get_current_win()
                    end)

                    MiniFiles.set_target_window(new_target_window)
                end

                -- Adding `desc` will result into `show_help` entries
                local desc = 'Split ' .. direction
                vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
            end

            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesBufferCreate',
                callback = function(args)
                    local buf_id = args.data.buf_id
                    -- Tweak keys to your liking
                    map_split(buf_id, 'gs', 'belowright horizontal')
                    map_split(buf_id, 'gv', 'belowright vertical')
                end,
            })
        end,

        keys = {
            { '-', function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end, desc = 'Open file explorer' },
        }

    }

}
