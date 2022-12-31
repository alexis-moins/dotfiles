return {
    { 'nvim-lua/plenary.nvim', lazy = true },

    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufWinEnter',

        config = {
            char_blankline = '│',
            use_treesitter = true,

            show_current_context = true,
            show_first_indent_level = false,
        }
    },

    {
        "folke/zen-mode.nvim",
        cmd = 'ZenMode',
        config = true
    },

    {
        "folke/twilight.nvim",
        cmd = 'Twilight',
        config = true
    },

    {
        'nvim-neorg/neorg',
        ft = 'norg',

        build = ':Neorg sync-parsers',
        config = {
            load = {
                ['core.defaults'] = {},
                ["core.norg.concealer"] = {},
                ['core.norg.dirman'] = {
                    config = {
                        workspaces = {
                            work = '~/notes/work',
                            school = '~/notes/school',
                        }
                    }
                }
            }
        }
    },

    -- UI
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',

        config = {
            input = {
                win_options = {
                    winblend = 0,
                    winhighlight = "NormalFloat:Normal,FloatBorder:Directory",
                }
            },
        }
    },

    {
        'sindrets/diffview.nvim',
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },

        config = function()

            require('diffview').setup {
                use_icons = false,
                enhanced_diff_hl = true,
            }

            local link = require 'utils'.link

            link('DiffAdd', 'String')
            link('DiffDelete', 'Debug')
            link('DiffChange', 'Float')
            link('DiffText', 'Todo')
        end
    },

    { 'jose-elias-alvarez/null-ls.nvim' },

    {
        -- Debugger
        'mfussenegger/nvim-dap',

        dependencies = {
            'rcarriga/nvim-dap-ui',
            'jay-babu/mason-nvim-dap.nvim',
        }
    },

    {
        'cvigilv/esqueleto.nvim',
        config = {
            directory = '~/.config/nvim/skeletons/',
            patterns = { 'README.md', 'python', 'LICENSE', 'lua' }
        },
    },

    {
        -- Colorscheme
        'shaunsingh/nord.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'nord'

            -- Transparent background
            vim.cmd.highlight('Normal ctermbg=none guibg=none')

            local link = require 'utils'.link

            link('SignColumn', 'Normal')
            link('NormalFloat', 'Normal')
            link('FloatBorder', 'Normal')
        end
    },

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,

        -- config = function()
        --     require 'catppuccin'.setup {
        --         -- flavour = 'macchiato',
        --         transparent_background = true,
        --     }
        --
        --     vim.cmd.colorscheme 'catppuccin'
        -- end
    },

    -- Editing stuff
    {
        'kylechui/nvim-surround',
        keys = {
            'ys', 'ds', 'cs',
            { 'S', mode = 'v' }
        },

        config = true,
    },

    {
        'numToStr/Comment.nvim',
        keys = { { 'gc', mode = 'v' }, 'gcc', 'gbc' },
        config = true,
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',

        config = true
    },
}
