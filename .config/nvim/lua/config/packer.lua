require('packer').startup(function(use)

    use 'nvim-lua/plenary.nvim'
    use 'wbthomason/packer.nvim'

    use { 'folke/which-key.nvim', config = function() require('which-key').setup {
            window = {
                border = 'single',
            },
        }
    end }

    use 'stevearc/dressing.nvim'

    use { 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end }

    use({
        'alexis-moins/nvim-tabline',
        config = function()
            require('tabline').setup({
                show_index = false, -- show tab index
                show_modify = true, -- show buffer modification indicator
                modify_indicator = '[+]', -- modify indicator
                no_name = '[No name]', -- no name buffer name
            })
        end,
    })

    -- Lsp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- lsp and tools
    use({
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',

        'jose-elias-alvarez/null-ls.nvim',
        'williamboman/mason-lspconfig.nvim',
    })

    -- Debugger
    use({
        'mfussenegger/nvim-dap'
    })

    -- Completion
    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Editing stuff
    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'

    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- Themes
    use {
        'shaunsingh/nord.nvim',
        'catppuccin/nvim', as = 'catppuccin'
    }

    -- Treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

end)

-- Creating autocommand group for Packer
local group = vim.api.nvim_create_augroup('PackerUserGroup', { clear = true })

-- Automatically run :PackerCompile whenever this file is changed
vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    command = 'source <afile> | PackerCompile',
    pattern = 'packer.lua'
})
