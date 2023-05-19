return {
    "nvim-telescope/telescope.nvim",

    keys = {
        { '<leader><space>', ':Telescope find_files theme=dropdown<cr>', desc = 'Find files',   silent = true },
        { '<leader>ff',      ':Telescope git_files theme=dropdown<cr>',  desc = 'Git files',    silent = true },
        { '<leader>fk',      ':Telescope keymaps theme=ivy<cr>',         desc = 'Find keymaps', silent = true },
        { '<leader>fg',      ':Telescope live_grep theme=ivy<cr>',       desc = 'Grep files',   silent = true },
        { '<leader>-',       ':Telescope file_browser<cr>',              desc = 'Grep files',   silent = true },
    },

    dependencies = {
        "nvim-telescope/telescope-file-browser.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            cond = vim.fn.executable("make") == 1,
            build = "make",
        },
    },

    init = function()
        local mapping = require("utils").map

        mapping('n', '<leader>fk', function()
            require('telescope.builtin').keymaps({
                modes = { 'n', 'i' },
                show_plug = false
            })
        end, 'Find Keymaps')


        mapping("n", "<leader>fb", function()
            require("telescope.builtin").buffers()
        end, "Find buffers")

        mapping("n", "<leader>fc", function()
            require("telescope.builtin").colorscheme()
        end, "Find colorscheme")

        mapping("n", "<leader>fh", function()
            require("telescope.builtin").help_tags()
        end, "Find help pages")

        mapping("n", "<leader>f.", function()
            require("telescope.builtin").command_history()
        end, "Find commands (history)")

        vim.keymap.set({ "n", "v" }, "<C-P>", function()
            require("telescope.builtin").registers()
        end, {
            desc = "Find registers",
        })

        vim.keymap.set("n", "<leader>fz", function()
            require("telescope.builtin").spell_suggest()
        end)

        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find()
        end, { desc = 'Search in the current buffer' })

        -- Extensions
        mapping("n", "-", function()
            require("telescope").extensions.file_browser.file_browser()
        end, "Browse files")
    end,
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        local options = {
            defaults = {},
            pickers = {
                buffers = {
                    show_all_buffers = true,
                    sort_mru = true,
                    theme = "ivy",
                    previewer = false,
                    mappings = {
                        i = {
                            ["<C-d>"] = "delete_buffer",
                        },
                        n = {
                            ["d"] = "delete_buffer",
                        },
                    },
                },
                current_buffer_fuzzy_find = {
                    skip_empty_lines = true,
                    theme = "ivy",
                },
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" },
                    theme = "dropdown",
                    previewer = false,
                },
                keymaps = {
                    theme = "ivy",
                },
                spell_suggest = {
                    theme = "dropdown",
                },
                git_files = {
                    theme = "dropdown",
                    previewer = false,
                },
                help_tags = {
                    theme = "dropdown",
                    previewer = false,
                },
                diagnostics = {
                    theme = "ivy",
                    no_sign = true,
                    bufnr = 0,
                },
                registers = {
                    theme = "dropdown",
                },
                git_branches = {
                    theme = "ivy",
                    show_remote_tracking_branches = false,
                },
                command_history = {
                    theme = "dropdown",
                    mappings = {
                        i = {
                            ["<C-e>"] = actions.edit_command_line,
                        },
                        n = {
                            ["e"] = actions.edit_command_line,
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
        }

        local pickers = {
            live_grep = true,
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

            options.pickers[picker].theme = "ivy"

            if not previewer then
                options.pickers[picker].previewer = false
            end
        end

        telescope.setup(options)

        -- Extensions
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
}
