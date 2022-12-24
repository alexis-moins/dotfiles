return {

    { 'nvim-lua/plenary.nvim', lazy = true },

    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufReadPre',

        config = function()
            require('indent_blankline').setup({
                char_blankline = '│',
                use_treesitter = true,
                show_first_indent_level = false,
            })
        end
    },

    { 'folke/which-key.nvim', lazy = true },

    -- UI
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',

        config = function()
            require('dressing').setup {
                input = {
                    win_options = {
                        winblend = 0,
                        winhighlight = "NormalFloat:Normal,FloatBorder:Directory",
                    }
                }
            }
        end
    },
    { 'nvim-lualine/lualine.nvim', event = 'VeryLazy' },

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
        -- Quick navigation
        'ggandor/leap.nvim',
        event = 'VeryLazy',

        dependencies = {
            'ggandor/flit.nvim',
            { 'alexis/leap-spooky', dev = true }
        }
    },

    {
        -- Language parser
        'nvim-treesitter/nvim-treesitter',
        build = vim.cmd.TSUpdateSync,

        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'nvim-treesitter/playground' },
        }
    },

    {
        'cvigilv/esqueleto.nvim',
        config = function()
            require('esqueleto').setup({
                directory = '~/.config/nvim/skeletons/',
                patterns = { 'README.md', 'python', 'LICENSE' }
            })
        end
    },

    {
        -- Colorscheme
        'shaunsingh/nord.nvim',
        config = function()
            vim.cmd.colorscheme('nord')
        end
    },

    -- Editing stuff
    'kylechui/nvim-surround',

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',

        config = function()
            require('nvim-autopairs').setup()
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

}

