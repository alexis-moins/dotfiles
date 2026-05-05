vim.wo.wrap = true

-- Prevent wrapping in the middle of class names
vim.opt_local.breakat:remove({ "-", ":" })
