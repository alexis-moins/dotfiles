vim.api.nvim_create_augroup('UserFiletype', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = { '*.md' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end
})
