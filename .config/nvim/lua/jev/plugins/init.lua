return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufWinEnter",
        config = {
            char_blankline = "│",
            use_treesitter = true,
            show_first_indent_level = false,
        },
    },

    {
        "mbbill/undotree",
        init = function()
            -- vim.keymap.set('n', '<C-')
        end
    },

    {
        "tpope/vim-fugitive",
        init = function()
            vim.keymap.set('n', '<C-g>', '<cmd>tab Git<cr>', {
                silent = true,
                desc = 'Open fugitive in a new tab'
            })
        end
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
