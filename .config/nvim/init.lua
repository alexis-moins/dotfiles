_G.Config = {}

local gr = vim.api.nvim_create_augroup("UserConfig", {})

_G.Config.new_autocmd = function(event, pattern, callback, desc)
	local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
	vim.api.nvim_create_autocmd(event, opts)
end

_G.Config.map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

_G.Config.maplocal = function(mode, lhs, rhs, desc, buffer)
	vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = buffer or true })
end
