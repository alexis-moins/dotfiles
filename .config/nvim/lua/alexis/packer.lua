require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    use 'folke/which-key.nvim'
    use 'stevearc/dressing.nvim'

    use { 'ggandor/leap.nvim', config = function()
        require('leap').add_default_mappings()
    end }

    use { '~/dev/nvim/leap-spooky.nvim', config = function()
        require('leap-spooky').setup()
    end }

    -- Lsp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    use { -- LSP and tools
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'j-hui/fidget.nvim'
        }
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    -- Debugger
    use {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        'mfussenegger/nvim-dap-python',
    }

    use { -- Completion
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
        }
    }

    use 'b0o/incline.nvim'
    use 'nvim-lualine/lualine.nvim'

    use { 'lukas-reineke/indent-blankline.nvim', config = function()
        require('indent_blankline').setup({
            use_treesitter = true,
            char_blankline = '│',
            show_first_indent_level = false,
        })
    end }

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    use {
        'nvim-telescope/telescope-fzf-native.nvim', cond = vim.fn.executable('make') == 1,
        run = 'make'
    }

    -- Editing stuff
    use 'kylechui/nvim-surround'

    use { 'windwp/nvim-autopairs', config = function()
        require('nvim-autopairs').setup()
    end }

    use { 'numToStr/Comment.nvim', config = function()
        require('Comment').setup()
    end }

    -- Themes
    use { 'shaunsingh/nord.nvim', config = function()
        vim.cmd.colorscheme('nord')
    end }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update { with_sync = true }
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

end)

-- Create a new autogroup
local packer = vim.api.nvim_create_augroup('Packer', {})

-- Automatically source this file
vim.api.nvim_create_autocmd('BufWritePost', {
    group = packer,

    pattern = 'packer.lua',
    command = 'source <afile> | PackerCompile'
})
