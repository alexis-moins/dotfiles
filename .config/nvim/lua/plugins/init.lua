return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufWinEnter',

        config = {
            char_blankline = '│',
            use_treesitter = true,
            show_first_indent_level = false,
        }
    },

    {
        "tpope/vim-fugitive",
    },

    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {
            snippet_engine = "luasnip",
        },
    },

    -- UI
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",

        config = {
            input = {
                win_options = {
                    winblend = 0,
                    winhighlight = "NormalFloat:Normal,FloatBorder:Directory",
                },
            },
        },
    },

    {
        -- Debugger
        "mfussenegger/nvim-dap",

        dependencies = {
            "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim",
        },
    },

    -- Editing stuff
    {
        "kylechui/nvim-surround",
        keys = {
            "ys",
            "ds",
            "cs",
            { "S", mode = "v" },
        },

        config = true,
    },

    {
        "numToStr/Comment.nvim",
        keys = { { "gc", mode = "v" }, "gcc", "gbc" },
        config = true,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
}
