local lualine = require('lualine')

local custom_nord = {
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

local filename = {
    'filename',
    file_status = false,
}

local statusline = {
    lualine_a = { mode },
    lualine_b = { filename, '%#Directory#%m' },
    lualine_c = { diagnostics },

    lualine_x = {},
    lualine_y = {},
    lualine_z = { git_diff },
}

local tabline = {
    lualine_a = { tabs }
}

lualine.setup({
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

    sections = statusline,
    tabline = tabline,
})

vim.opt.showtabline = 1
