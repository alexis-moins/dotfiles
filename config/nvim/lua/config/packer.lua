-- Automatically run PackerCompile when plugins.lua is updated
vim.cmd [[
  augroup Packer
  autocmd!
  autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]] 

-- Install plugins using packer.nvim
require('packer').startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Packer can manage itself
    use 'neovim/nvim-lspconfig'

    -- Nvim Treesitter configurations and abstraction layer
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Treesitter playground integrated into Neovim
    use { 'nvim-treesitter/playground', run = 'TSInstall query' }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Completion engine
    use 'hrsh7th/nvim-cmp'

    -- Complete with words from the current buffer
    use 'hrsh7th/cmp-buffer'

    -- Complete with directory / file path
    use 'hrsh7th/cmp-path'

    -- Complete neovim's vim api in lua
    use 'hrsh7th/cmp-nvim-lua'

    -- Complete with lsp
    use 'hrsh7th/cmp-nvim-lsp'

    -- 
    use 'onsails/lspkind-nvim'

end)
