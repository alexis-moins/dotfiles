require('which-key').setup({
    plugins = {
        spelling = {
            enabled = true,
        },
    },

    window = {
        border = 'single'
    }
})

vim.cmd([[hi! link WhichKeyDesc String]])
vim.cmd([[hi! link WhichKeyFloat Normal]])
vim.cmd([[hi! link WhichKeyBorder Normal]])
