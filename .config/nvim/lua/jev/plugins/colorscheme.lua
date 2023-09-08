return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        opts = {
            highlight_groups = {
                StatusLine = { fg = "base", bg = "base" },
            },
        },
    },

    {
        "projekt0n/github-nvim-theme",
        name = "github",
        priority = 1000
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                custom_highlights = function(colors)
                    return {
                        Folded = { fg = colors.surface2, bg = colors.base },
                        NormalFloat = { bg = colors.base },
                        TabLineSel = { fg = colors.blue, bg = colors.base },
                        TabLine = { fg = colors.surface2, bg = colors.base },
                        StatusLine = { fg = colors.base, bg = colors.base },
                        CmpBorder = { fg = colors.blue },
                        TelescopeMatching = { fg = colors.green, bg = "none" },
                        TelescopeNormal = { fg = colors.surface2 },
                        TelescopeBorder = { fg = colors.blue },
                        TelescopeSelection = { fg = colors.text, bg = colors.base },
                        TelescopeSelectionCaret = { fg = colors.red },
                        TelescopePromptTitle = { fg = colors.green },
                        TelescopePromptPrefix = { fg = colors.blue },
                        Todo = {},
                        MiniFilesBorderModified = { fg = colors.red },
                        NonText = { fg = "#494d64" },

                        MiniClueDescGroup = { fg = colors.red },
                        MiniClueSeparator = { fg = colors.base },

                        MiniClueNextKey = { fg = colors.mauve },
                        MiniClueNextKeyWithPostKeys = { fg = colors.mauve },

                        DiffDelete = { fg = colors.mantle, bg = "#48384b" },

                        MiniTablineCurrent = { fg = colors.text },
                        -- MiniTablineModifiedVisible = { fg = colors.blue },
                    }
                end,
                integrations = {
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = true,
                    },
                    native_lsp = {
                        enabled = true,
                    },
                },
            })

            vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { link = 'TabLine' })
            vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { link = 'TabLine' })
            vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { link = 'Normal' })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
