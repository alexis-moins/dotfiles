local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('jev.plugins', {
    dev = {
        path = '~/dev/nvim',
        patterns = { 'alexis' },
    },
    ui = {
        border = 'single'
    },
    install = {
        colorscheme = { 'catppuccin', 'habamax' },
    },
})

local mapping = require('utils').map

-- [I]nstall plugins
mapping('n', '<leader>pi', require("lazy").sync, 'Install, clean and update plugins')
mapping('n', '<leader>ph', require("lazy").home, 'Open lazy popup')
