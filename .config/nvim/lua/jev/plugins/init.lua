return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "tpope/vim-fugitive",
        cmd = 'Git',

        keys = {
            { '<C-G>', '<cmd>tab Git<CR>', desc = 'Open fugitive in a new tab', silent = true }
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

}
