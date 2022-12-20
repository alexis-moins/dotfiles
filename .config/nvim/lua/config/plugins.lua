return {

    'nvim-lua/plenary.nvim',

    { 'shaunsingh/nord.nvim', config = function() vim.cmd.colorscheme('nord') end },

    { 'lewis6991/gitsigns.nvim', event = 'BufReadPre' },
    { 'lukas-reineke/indent-blankline.nvim', event = 'BufReadPre' },

    { 'folke/which-key.nvim' },

    { 'stevearc/dressing.nvim', event = 'VeryLazy' },
    { 'nvim-lualine/lualine.nvim', event = 'VeryLazy' },

    {
        -- Code completion
        'hrsh7th/nvim-cmp',

        dependencies = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',

            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    },

    {
        -- Language servers
        'neovim/nvim-lspconfig',

        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'j-hui/fidget.nvim'
        }
    },

    { 'jose-elias-alvarez/null-ls.nvim' },

    {
        -- Debugger
        'mfussenegger/nvim-dap',

        dependencies = {
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-dap-python',
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
        -- Fuzzy finder
        'nvim-telescope/telescope.nvim',

        dependencies = {
            'nvim-telescope/telescope-file-browser.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make', cond = vim.fn.executable 'make' == 1
            },
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

    -- Editing stuff
    'kylechui/nvim-surround',

    { 'windwp/nvim-autopairs', config = function()
        require('nvim-autopairs').setup()
    end },

    { 'numToStr/Comment.nvim', config = function()
        require('Comment').setup()
    end },

}
