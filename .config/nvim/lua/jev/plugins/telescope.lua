return {
    "nvim-telescope/telescope.nvim",
    cmd = 'Telescope',

    keys = {
        { '<leader><space>', '<cmd>Telescope find_files<CR>',      desc = 'Find files',            silent = true },
        { '<leader>fk',      '<cmd>Telescope keymaps<CR>',         desc = 'Find keymaps',          silent = true },
        { '<leader>fg',      '<cmd>Telescope live_grep<CR>',       desc = 'Grep files',            silent = true },
        { '<leader>fb',      '<cmd>Telescope buffers<CR>',         desc = 'Find buffers',          silent = true },
        { '<leader>fh',      '<cmd>Telescope help_tags<CR>',       desc = 'Find help',             silent = true },
        { '<leader>:',       '<cmd>Telescope command_history<CR>', desc = 'Open command history',  silent = true },
        { '<C-R>',           '<cmd>Telescope registers<CR>',       desc = 'Find register content', mode = 'i' },
        { '-',               '<cmd>Telescope file_browser<CR>',    desc = 'Open file browser',     silent = true },
    },

    dependencies = {
        "nvim-telescope/telescope-file-browser.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            cond = vim.fn.executable("make") == 1,
            build = "make",
        },
    },

    opts = {
        defaults = {
            mappings = {
                n = {
                    ['q'] = 'close',
                },

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

            live_grep = {
                theme = 'ivy'
            },

            help_tags = {
                previewer = false,
                theme = 'ivy'
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

        },

        extensions = {
            file_browser = {
                theme = "ivy",
                path = "%:p:h",
                quiet = true,
                display_stat = false,
                previewer = false,
                git_status = false,
                hidden = true,
                hijack_netrw = true,
                respect_gitignore = true,
            },
        },

    },

    config = function(_, opts)
        local telescope = require("telescope")

        telescope.setup(opts)

        -- Extensions
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
}
