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
        -- Debugger
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim",
        },
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
            modes = { insert = true, command = true, terminal = true },
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
    }
}
