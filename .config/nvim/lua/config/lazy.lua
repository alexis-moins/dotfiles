local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'git@github.com:folke/lazy.nvim.git',
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

local plugins = require('config.plugins')
local options = {
    dev = {
        path = '~/dev/nvim',
        patterns = { 'alexis' },
    },

    ui = {
        border = 'single'
    },

    install = {
        colorscheme = { 'nord', 'habamax' },
    },
}

require('lazy').setup(plugins, options)

-- Mappings
vim.keymap.set('n', '<leader>I', require("lazy").sync, { desc = 'Install, clean and update plugins' })
