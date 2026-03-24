vim.wo.wrap = true
vim.wo.spell = true

vim.bo.textwidth = 80

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.treesitter.foldexpr()'
