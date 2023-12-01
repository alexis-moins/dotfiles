return {
    "nvim-telescope/telescope.nvim",
    cmd = 'Telescope',

    keys = {
        { '<Leader><space>', '<cmd>Telescope find_files<CR>', desc = 'Find files',   silent = true },
        { '<Leader>fk',      '<cmd>Telescope keymaps<CR>',    desc = 'Find keymaps', silent = true },
        { '<Leader>fg',      '<cmd>Telescope live_grep<CR>',  desc = 'Grep files',   silent = true },
        { '<Leader>fb',      '<cmd>Telescope buffers<CR>',    desc = 'Find buffers', silent = true },
        { '<Leader>fh',      '<cmd>Telescope help_tags<CR>',  desc = 'Find help',    silent = true },
        {
            '<Leader>fc',
            '<cmd>Telescope command_history<CR>',
            desc = 'Open command history',
            silent = true,
            mode = {
                'n', 'v' }
        },
        { '<Leader>*',  '<cmd>Telescope grep_string<CR>',               desc = 'Grep item under cursor', silent = true },
        { 'gz',         '<cmd>Telescope spell_suggest<CR>',             desc = 'Find spelling',          silent = true },
        { '/',          '<cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Find in buffer',         silent = true },
        { '<Leader>rr', '<cmd>Telescope registers<CR>',                 desc = 'Find register content',  mode = 'n' },
        { '<C-P>',      '<cmd>Telescope registers<CR>',                 desc = 'Find register content',  mode = 'i' },
    },

    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            cond = vim.fn.executable("make") == 1,
            build = "make",
        },
    },

    opts = function()
        local actions = require('telescope.actions')

        return {
            defaults = {
                mappings = {
                    n = {
                        ['q'] = actions.close,
                    },
                    i = {
                        ['<C-L>'] = actions.smart_send_to_loclist + actions.open_loclist,
                        ['<C-Q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                    }
                }
            },

            pickers = {
                buffers = {
                    show_all_buffers = true,
                    sort_mru = true,

                    theme = "ivy",

                    mappings = {
                        i = {
                            ["<C-d>"] = "delete_buffer",
                        },
                        n = {
                            ["d"] = "delete_buffer",
                        },
                    }
                },

                grep_string = {
                    theme = 'ivy'
                },

                live_grep = {
                    theme = 'ivy',
                    disable_coordinates = true,
                    previewer = true,
                },

                current_buffer_fuzzy_find = {
                    theme = 'ivy',
                },

                spell_suggest = {
                    theme = 'dropdown'
                },

                help_tags = {
                    previewer = false,
                    theme = 'dropdown'
                },

                keymaps = {
                    theme = 'ivy',
                },

                find_files = {
                    theme = 'dropdown',
                    previewer = false,

                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" },
                },

                diagnostics = {
                    theme = "ivy",

                    no_sign = true,
                    bufnr = 0,
                },

                registers = {
                    theme = 'dropdown'
                },

                command_history = {
                    previewer = false,
                    theme = "dropdown",

                    mappings = {
                        i = {
                            ["<C-e>"] = 'edit_command_line',
                        },
                        n = {
                            ["e"] = 'edit_command_line',
                        },
                    },
                },

                lsp_document_symbols = {
                    theme = "ivy",
                },

                lsp_definitions = {
                    theme = "ivy",
                },

                lsp_type_definitions = {
                    theme = "ivy",
                },

                lsp_implementations = {
                    theme = "ivy",
                },

                lsp_references = {
                    theme = "ivy",
                },

                lsp_dynamic_workspace_symbols = {
                    theme = 'ivy'
                }
            },
        }
    end,

    config = function(_, opts)
        local telescope = require("telescope")

        telescope.setup(opts)

        -- Extensions
        telescope.load_extension("fzf")
    end,
}
