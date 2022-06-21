-- packer install
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Adding packages
local packer = require('packer')

packer.startup(function(use)

  -- Packer manages itself
  use('wbthomason/packer.nvim')

  -- Lsp
  use('neovim/nvim-lspconfig')
  -- Snippets
  use('L3MON4D3/LuaSnip')

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Editing stuff
  use('windwp/nvim-autopairs')
  use('numToStr/Comment.nvim')

  -- Themes
  use('AlexisMoins/embark')

  -- Treesitter
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    packer.sync()
  end

end)

-- Configuring installed plugins
require('Comment').setup({})
require('nvim-autopairs').setup({})

require('plugins.completion')
require('plugins.telescope')
require('plugins.lsp')
