-- Package manager
local packer = require 'packer'

-- {{{ Packages
packer.startup(function(use)

    use 'nvim-lua/plenary.nvim'
    use 'wbthomason/packer.nvim'

    use 'ThePrimeagen/vim-be-good'

    -- Lsp
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }

    use "neovim/nvim-lspconfig"
    use 'jose-elias-alvarez/null-ls.nvim'

    use "williamboman/mason.nvim"
    use 'WhoIsSethDaniel/mason-tool-installer.nvim'

    -- Completion
    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Editing stuff
    use 'kylechui/nvim-surround'
    use 'windwp/nvim-autopairs'

    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- Themes
    use { 'alexis-moins/embark', config = function() vim.cmd [[colorscheme embark]] end }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'

end)
-- }}}

-- packages configuration
require'config.packages.lsp'
require'config.packages.telescope'

require'config.packages.completion'
require'config.packages.treesitter'

require('nvim-surround').setup()
require('nvim-autopairs').setup()
