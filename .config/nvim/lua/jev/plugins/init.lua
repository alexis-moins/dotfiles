return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    -- {
    --     'Olical/conjure'
    -- },

    {
        "tpope/vim-fugitive",
        init = function()
            vim.keymap.set("n", "<C-g>", "<cmd>tab Git<cr>", {
                silent = true,
                desc = "Open fugitive in a new tab",
            })

            vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", {
                silent = true,
                desc = "Push current commit",
            })
        end,
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
        "echasnovski/mini.sessions",
        opts = {
            autowrite = false,
            verbose = { write = true, read = true }
        },
        init = function()
            vim.keymap.set('n', '<leader>ss', function() MiniSessions.write() end)
        end
    },

    {
        "echasnovski/mini.bracketed",
        event = "VeryLazy",
        opts = {
            location = { suffix = '' },
            treesitter = { suffix = '' },
            oldfile = { suffix = '' },
            undo = { suffix = '' },
        }
    },

    {
        "echasnovski/mini.jump",
        event = "VeryLazy",
        opts = {}
    }
}
