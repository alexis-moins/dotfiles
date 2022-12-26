local plugin = {
    'nvim-lualine/lualine.nvim',
    event = 'BufWinEnter'
}

plugin.config = function()

    local custom_nord = {
        normal = {
            a = 'StatusLineNC',
            b = 'StatusLineNC',
            c = 'StatusLineNC',
        },
        inactive = {
            a = 'Normal',
            b = 'Normal',
            c = 'Normal',
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
        end
    }

    local diagnostics = {
        'diagnostics',
        -- color = 'StatusLineNC',

        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
        update_in_insert = true,
    }

    local mode = {
        'mode',
        color = 'DiffAdd'
    }

    local filename = {
        'filename',
        file_status = false,
    }

    local marker = {
        '%#DiffAdd# ',

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
            lualine_b = { filename },
            lualine_c = { diagnostics },

            lualine_x = {},
            lualine_y = { git_diff },
            lualine_z = { marker },
        },

        tabline = {
            lualine_a = { tabs },
            lualine_z = { marker },
        },
    }

    vim.opt.showtabline = 1
end

return plugin
