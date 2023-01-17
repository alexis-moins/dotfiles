local plugin = {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy'
}

plugin.config = function()

    local custom_nord = {
        normal = {
            a = { fg = '#1e2030', bg = '#8aadf4' },
            b = { fg = '#6e738d', bg = '#303347' },
            c = 'CursorLine',

            x = { fg = '#6e738d', bg = '#303347' },
            y = { fg = '#ed8796', bg = '#303347' },
            z = { fg = '#1e2030', bg = '#ed8796' },
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
            active = 'DiffAdd',
            inactive = 'Comment',
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

        padding = { right = 2 }
    }

    local git_branch = {
        'branch',
        separator = { left = '' },
        -- icon = ' ',
        -- color = { fg = '#1e2030', bg = '#f5bde6' },
        -- separator = { left = '' }
        padding = {
            right = 2
        }
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
        -- separator = { left = '' },
        separator = { left = '' },
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
            lualine_a = { mode },
            lualine_b = { { 'progress', padding = { left = 2 } } },
            lualine_c = { diagnostics },

            lualine_x = { git_diff },
            lualine_y = { git_branch },
            lualine_z = { filename },
        },
    }

    vim.opt.showtabline = 1
end

return plugin
