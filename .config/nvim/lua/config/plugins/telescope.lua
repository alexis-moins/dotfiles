local options = {
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" },
            theme = 'dropdown',
            previewer = false,
        },
    },

    extensions = {
        file_browser = {
            theme = "ivy",
            path = "%:p:h",
            quiet = true,

            display_stat = false,
            previewer = false,

            hidden = true,
            hijack_netrw = true,
            respect_gitignore = true,
        },

        undo = {
            theme = 'ivy'
        }
    }
}

local dropdown_pickers = {
    'buffers',
    'help_tags',
    'man_pages',
    'git_files'
}

for _, picker in ipairs(dropdown_pickers) do
    options.pickers[picker] = {
        theme = 'dropdown',
        previewer = false,
    }
end

local ivy_pickers = {
    'oldfiles',
    'live_grep',
    'diagnostics',
    'lsp_references',
}

for _, picker in ipairs(ivy_pickers) do
    options.pickers[picker] = { theme = 'ivy' }
end

return {
    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',

    dependencies = {
        'debugloop/telescope-undo.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make', cond = vim.fn.executable 'make' == 1
        },
    },

    init = function()
        local mapping = require('utils').mapping

        mapping('n', '<leader><leader>', function() require('telescope.builtin').find_files() end, 'Find files')

        mapping('n', '<leader>ff', function() require('telescope.builtin').git_files() end, 'Find files (git)')
        mapping('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, 'Grep files')

        mapping('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, 'Find help pages')
        mapping('n', '<leader>fe', function() require('telescope.builtin').command_history() end, 'Find commands (history)')

        -- Extensions
        mapping('n', '-', function() require('telescope').extensions.file_browser.file_browser() end, 'Browse files')
    end,

    config = function()
        local telescope = require('telescope')
        telescope.setup(options)

        -- Extensions
        telescope.load_extension('fzf')
        telescope.load_extension('file_browser')
    end
}
