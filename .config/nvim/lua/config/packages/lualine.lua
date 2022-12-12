local lualine = require('lualine')

local nord_theme = {
    normal = {
        a = 'Normal',
        b = 'Normal',
        c = 'Normal',
    },
    inactive = {},
}

local git_branch = {
    'branch',
    color = 'Float'
}

local filename = {
    'filename',
    color = 'Normal',
    file_status = false,
}


local diagnostics = {
    'diagnostics',
    color = 'Normal',

    symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
    update_in_insert = true,
}


local winbar = {
    lualine_z = { '%#Directory#%m', diagnostics, filename }
}

local statusline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},

    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'diff', git_branch },
}

lualine.setup({
    options = {
        theme = nord_theme,
        section_separators = { left = ' ', right = ''},
        component_separators = { left = ' ', right = ''},

        refresh = {
            winbar = 200,
        },
    },

    sections = statusline,
    inactive_sections = statusline,

    winbar = winbar,
    inactive_winbar = winbar,

    tabline = {
        lualine_a = { 'buffers' },
        lualine_z = {
            {
                'tabs',
                tabs_color = {
                    active = 'IncSearch',
                    inactive = 'Normal'
                }
            }
        }
    }
})

vim.opt.showtabline = 1
