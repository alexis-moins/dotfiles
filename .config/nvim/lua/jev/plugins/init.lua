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
}
