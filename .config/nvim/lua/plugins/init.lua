return {
    {
        'nvim-lua/plenary.nvim',
        lazy = true
    },

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

    -- {
    --     'lewis6991/hover.nvim',
    --     opts = {
    --         init = function()
    --             require('hover.providers.man')
    --             require('hover.providers.lsp')
    --             require('hover.providers.dictionary')
    --         end,
    --
    --         preview_opts = {
    --             border = 'rounded'
    --         },
    --
    --         title = false
    --     }
    -- },

    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {
            snippet_engine = "luasnip"
        },
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

        -- config = function()
        --     vim.cmd.colorscheme 'nord'
        --
        --     -- Transparent background
        --     vim.cmd.highlight('Normal ctermbg=none guibg=none')
        --
        --     local link = require 'utils'.link
        --
        --     link('SignColumn', 'Normal')
        --     -- link('NormalFloat', 'Normal')
        --     -- link('FloatBorder', 'Normal')
        -- end
    },

    {
        "CKolkey/ts-node-action",
        dependencies = { 'nvim-treesitter' },

        config = true,

        init = function()
            vim.keymap.set('n', 'L', function()
                require 'ts-node-action'.node_action()
            end, { desc = "Trigger Node Action" })
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
