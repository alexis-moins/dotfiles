local lualine = require('lualine')

local nord_theme = {
    normal = {
        a = 'Normal',
        b = 'Normal',
        c = 'Normal',
    },
    inactive = {
        a = 'Normal',
        b = 'Normal',
        c = 'Normal',
    },
}

-- local git_branch = {
--     'branch',
--     color = 'Boolean',
--     icons_enabled = false,
-- }

local tabs = {
    'tabs',
    mode = 1,

    tabs_color = {
        active = 'Normal',
        inactive = 'Comment',
    },
}


local diagnostics = {
    'diagnostics',
    color = 'Normal',

    symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
    update_in_insert = true,
}


local winbar = {
    lualine_z = { '%#Directory#%m', 'diff', diagnostics, tabs }
}

local statusline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},

    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
}

lualine.setup({
    options = {
        theme = nord_theme,
        section_separators = { left = ' ', right = '' },
        component_separators = { left = ' ', right = '' },

        refresh = {
            winbar = 200,
        },
    },

    sections = statusline,
    inactive_sections = statusline,

    winbar = winbar,
    inactive_winbar = winbar,
})
