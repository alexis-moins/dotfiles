return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
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
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {},

        keys = {
            { '<Leader>df', '<cmd>Neogen func<cr>', silent = true }
        }
    },

    {
        "tpope/vim-projectionist",
        event = "VeryLazy"
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy"
    },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { { "prettierd", "prettier" } },
            },
        },
    },


    {
        "j-hui/fidget.nvim",
        opts = {},
    },

    {
        "folke/twilight.nvim",
        opts = {}
    }
}
