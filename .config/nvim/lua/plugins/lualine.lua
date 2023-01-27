local plugin = {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy'
}

plugin.config = function()

    local custom_nord = {
        normal = {
            a = { fg = '#24273a', bg = '#ed8796' },
            b = { fg = '#6e738d', bg = '#24273a' },
            c = { bg = '#24273a' },

            x = { bg = '#24273a' },
            y = { fg = '#6e738d', bg = '#24273a' },
            z = { fg = '#24273a', bg = '#ed8796' },
        },
    }

    local tabs = {
        'tabs',
        mode = 1,

        -- Dynamic max_length
        max_length = function()
            return vim.o.columns
        end,

        tabs_color = {
            inactive = 'Comment',
            active = 'DiffAdd',
        },
    }

    local git_diff = {
        'diff',
        -- symbols = { added = ' ', modified = '柳', removed = ' ' },

        -- Use gitsigns as source
        source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed
                }
            end
        end,
        padding = { left = 1 }
    }

    local git_branch = {
        'branch',
        -- separator = { left = '' },
        -- icon = ' ',
        -- color = { fg = '#1e2030', bg = '#f5bde6' },
        -- separator = { left = '' }
        separator = { right = '' }
    }

    local diagnostics = {
        'diagnostics',
        cond = disabled_filetypes,

        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
        update_in_insert = true,
        padding = { left = 2 },
    }

    local mode = {
        'mode',
        -- separator = { right = '' }
        separator = { right = '' }
    }

    local filename = {
        'filename',
        file_status = false,
        -- separator = { right = '' }
        -- color = { fg = '#6e738d', bg = '#24273a' }
        -- separator = { left = '' },
        -- separator = { left = '' },
        separator = { right = '' }
    }

    local marker = {
        function()
            return '▊'
        end,
        color = { fg = '#a3be8c', bg = '#3b4252' },

        padding = {
            right = 0
        }
    }

    require 'lualine'.setup {
        options = {
            theme = custom_nord,
            section_separators = '',
            component_separators = '',
            globalstatus = true,

            refresh = {
                statusline = 200,
                winbar = 200,
                tabline = 200
            }
        },

        sections = {
            lualine_a = { git_branch },
            lualine_b = { git_diff },
            lualine_c = {},

            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },

        winbar = {
            lualine_y = { diagnostics, { '%m', color = 'Error' } },
            lualine_z = { { '%t', color = { fg = '#6e738d', bg = '#24273a' } } }
        },

        inactive_winbar = {
            lualine_y = { diagnostics, { '%m', color = 'Error' } },
            lualine_z = { { '%t', color = { fg = '#6e738d', bg = '#24273a' } } }
        }
    }

    vim.opt.showtabline = 1
end

return plugin
