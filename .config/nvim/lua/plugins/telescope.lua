return {
    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make', cond = vim.fn.executable 'make' == 1
        },
    },

    init = function()
        local mapping = require('utils').map

        mapping('n', '/', function() require('telescope.builtin').current_buffer_fuzzy_find() end, 'Search current buffer')

        mapping('n', '<leader><leader>', function() require('telescope.builtin').find_files() end, 'Find files')

        mapping('n', '<leader>ff', function() require('telescope.builtin').git_files() end, 'Find files (git)')
        mapping('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, 'Grep files')
        mapping('n', '<leader>fb', function() require('telescope.builtin').buffers() end, 'Find buffers')

        mapping('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, 'Find help pages')
        mapping('n', '<leader>fe', function() require('telescope.builtin').command_history() end,
            'Find commands (history)')

        -- Extensions
        mapping('n', '<leader>f.', function() require('telescope').extensions.file_browser.file_browser() end,
            'Browse files')
    end,

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        local options = {
            defaults = {
            },

            pickers = {
                buffers = {
                    show_all_buffers = true,
                    sort_mru = true,

                    theme = 'ivy',

                    previewer = false,
                    mappings = {
                        i = {
                            ['<C-d>'] = "delete_buffer"
                        },

                        n = {
                            ['d'] = "delete_buffer"
                        }
                    }
                },

                current_buffer_fuzzy_find = {
                    skip_empty_lines = true,
                    theme = 'ivy',
                },

                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" },
                    theme = 'dropdown',
                    previewer = false,
                },

                help_tags = {
                    theme = 'dropdown',
                    previewer = false,
                },

                command_history = {
                    theme = 'dropdown',
                    mappings = {
                        i = {
                            ['<C-e>'] = actions.edit_command_line
                        },
                        n = {
                            ['e'] = actions.edit_command_line
                        },
                    }
                },
            },

            extensions = {
                file_browser = {
                    theme = 'ivy',
                    path = '%:p:h',
                    quiet = true,

                    display_stat = false,
                    previewer = false,
                    git_status = false,

                    hidden = true,
                    hijack_netrw = true,
                    respect_gitignore = true,
                }
            }
        }

        local pickers = {
            live_grep = true,
            git_files = false,

            lsp_definitions = true,
            lsp_type_definitions = true,
            lsp_implementations = true,
            lsp_references = true,
            lsp_document_symbols = true,
        }

        for picker, previewer in pairs(pickers) do
            if type(options.pickers[picker]) == "nil" then
                options.pickers[picker] = {}
            end

            options.pickers[picker].theme = 'ivy'

            if not previewer then
                options.pickers[picker].previewer = false
            end
        end

        telescope.setup(options)

        -- Extensions
        telescope.load_extension('fzf')
        telescope.load_extension('file_browser')
    end
}
