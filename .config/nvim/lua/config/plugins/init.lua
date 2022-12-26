return {
    { 'nvim-lua/plenary.nvim', lazy = true },

    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufWinEnter',

        config = {
            char_blankline = '│',
            use_treesitter = true,
            show_first_indent_level = false,
        }
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
            }
        }
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
        config = function()
            vim.cmd.colorscheme('nord')
        end
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
