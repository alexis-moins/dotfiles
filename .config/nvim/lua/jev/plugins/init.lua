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
    }
}
