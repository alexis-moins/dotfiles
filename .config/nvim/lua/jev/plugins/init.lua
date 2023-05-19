return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "tpope/vim-fugitive",
        keys = {
            { '<C-G>', ':tab Git<CR>', desc = 'Open fugitive in a new tab', silent = true }
        }
    },

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = {
            input = {
                win_options = {
                    winblend = 0,
                },
            },
        },
    },

    {
        "numToStr/Comment.nvim",
        keys = { { "gc", mode = "v" }, "gcc", "gbc" },
        config = true,
    },

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
            -- undo = { suffix = '' },
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
        "folke/trouble.nvim",
        keys = {
            { '<leader>q', ':TroubleToggle<CR>', desc = 'Toggle Trouble window', silent = true }
        },

        opts = {
            icons = false,
            fold_open = 'v',
            fold_closed = '>',

            indent_lines = false,
            use_diagnostic_signs = true
        }
    }

}
