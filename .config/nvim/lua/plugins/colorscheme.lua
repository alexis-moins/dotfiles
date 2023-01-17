return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,

    config = function()
        require 'catppuccin'.setup {
            flavour = 'macchiato',

            custom_highlights = function(colors)
                return {
                    Folded = { fg = colors.surface2, bg = colors.base },
                    NormalFloat = { bg = colors.base },
                    CmpBorder = { fg = colors.blue },

                    TelescopeMatching = { fg = colors.green, bg = "none" },

                    TelescopeNormal = { fg = colors.overlay1 },
                    TelescopeBorder = { fg = colors.overlay1 },
                    TelescopeSelection = { fg = colors.text, bg = colors.base },

                    TelescopeSelectionCaret = { fg = colors.red },
                    TelescopePromptTitle = { fg = colors.green },
                    TelescopePromptPrefix = { fg = colors.blue }
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
            }
        }

        vim.cmd.colorscheme 'catppuccin'
    end

}
