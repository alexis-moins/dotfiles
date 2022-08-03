-- {{{ Packer installer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end
-- }}}

-- Package manager
local packer = require('packer')

-- {{{ Packages
packer.startup(function(use)

    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Lsp
    use 'neovim/nvim-lspconfig'
    use { 'williamboman/nvim-lsp-installer', requires = { 'neovim/nvim-lspconfig' } }
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }

    -- Completion
    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Editing stuff
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
    use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Themes
    use { 'AlexisMoins/embark', config = function() vim.cmd.colorscheme [[embark]] end }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = function() require('nvim-treesitter.configs').setup({ highlight = { enable = true } }) end }

    -- Automatically set up your configuration after cloning packer.nvim
    if is_bootstrap then
        packer.sync()
    end

end)
-- }}}

-- When we are bootstrapping a configuration, tell
-- the user that neovim is getting bootstraped
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes'
    print '=================================='
    return
end

-- Creating autocommand group for Packer
local group = vim.api.nvim_create_augroup('PackerUserGroup', { clear = true })

-- Automatically run :PackerCompile whenever this file is changed
vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    command = 'source <afile> | PackerCompile',
    pattern = 'packer.lua'
})

-- packages configuration
require('config.packages.lsp')
require('config.packages.completion')
require('config.packages.telescope')
require('config.packages.gitsigns')
