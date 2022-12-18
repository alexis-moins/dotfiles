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

local git_branch = {
    'branch',
    color = 'Comment',
}

local tabs = {
    'tabs',
    mode = 1,

    -- Dynamic max_length
    max_length = function()
        return vim.o.columns
    end,

    tabs_color = {
        active = 'Normal',
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
    color = 'Normal',

    symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
    update_in_insert = true,
}

local mode = {
    'mode',
    color = 'DiffAdd'
}

local statusline = {
    lualine_a = { mode, tabs },
    lualine_b = { diagnostics },
    lualine_c = { '%#Directory#%m' },

    lualine_x = {},
    lualine_y = { git_diff },
    lualine_z = { git_branch },
}

lualine.setup({
    options = {
        theme = nord_theme,
        section_separators = '',
        component_separators = '',

        globalstatus = true,

        refresh = {
            statusline = 200,
            winbar = 200,
            tabline = 200
        }
    },

    sections = statusline,
    inactive_sections = statusline,
})
