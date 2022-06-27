-- {{{ Packer installer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end
-- }}}

local simple_setup = function(plugin)
    require(plugin).setup()
end

-- {{{ Packages
require('packer').startup(function(use)

  -- Packer manages itself
  use('wbthomason/packer.nvim')

  -- Lsp
  use('neovim/nvim-lspconfig')
  use({ 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } })

  -- Completion
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Editing stuff
  use({ 'numToStr/Comment.nvim', config = simple_setup('Comment') })
  use({ 'windwp/nvim-autopairs', config = simple_setup('nvim-autopairs') })

  -- Git
  use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })

  -- Themes
  use('AlexisMoins/embark')

  -- Treesitter
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end

end)
-- }}}


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- packages configuration
require('config.packages.lsp')
require('config.packages.gitsigns')
require('config.packages.telescope')
require('config.packages.completion')
