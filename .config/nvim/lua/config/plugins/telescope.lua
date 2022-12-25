return {
    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',

    dependencies = {
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
        mapping('n', '<leader>fe', function() require('telescope.builtin').command_history() end,
            'Find commands (history)')

        -- Extensions
        mapping('n', '-', function() require('telescope').extensions.file_browser.file_browser() end, 'Browse files')
    end,

    config = function()
        local telescope = require('telescope')

        local options = {
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" },
                    theme = 'ivy',
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
            }
        }

        local pickers = {
            live_grep = true,
            git_files = false,
            help_tags = false,
        }

        for picker, previewer in pairs(pickers) do
            options.pickers[picker] = {
                theme = 'ivy',
                previewer = previewer
            }
        end

        telescope.setup(options)

        -- Extensions
        telescope.load_extension('fzf')
        telescope.load_extension('file_browser')

        -- Highlighting
        vim.cmd [[hi! link TelescopeMatching None]]
        vim.cmd [[hi! link TelescopeSelectionCaret Debug]]

        vim.cmd [[hi! link TelescopeNormal Comment]]
        vim.cmd [[hi! link TelescopeSelection Constant]]

        vim.cmd [[hi! link TelescopePromptTitle String]]
        vim.cmd [[hi! link TelescopePromptNormal Constant]]

        vim.cmd [[hi! link TelescopeBorder SpellBad]]
    end
}
