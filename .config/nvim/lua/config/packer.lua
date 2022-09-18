-- {{{ Bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- }}}

-- Packages
require('packer').startup(function(use)

    use 'nvim-lua/plenary.nvim'
    use 'wbthomason/packer.nvim'

    use 'ThePrimeagen/vim-be-good'

    -- Lsp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

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

    use 'ThePrimeagen/harpoon'

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

    if packer_bootstrap then
        require('packer').sync()
    end

end)