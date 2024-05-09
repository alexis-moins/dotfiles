--
-- Options
--
local function set(name, value)
	vim.opt[name] = value
end

local function setlocal(name, value)
	vim.opt_local[name] = value
end

local function setglobal(name, value)
	vim.g[name] = value
end

_G.opt = {
	set = set,
	setlocal = setlocal,
	setglobal = setglobal,
}

--
-- Keymaps
--
local function map(modes, keys, action, description)
	local opts = { desc = description }
	return vim.keymap.set(modes, keys, action, opts)
end

local function maplocal(modes, keys, action, description, buffer)
	local opts = { desc = description, buffer = buffer }
	return vim.keymap.set(modes, keys, action, opts)
end

local function toggle(option)
	return function()
		local opt = vim.opt_local[option]:get()
		vim.opt_local[option] = not opt
	end
end

_G.keys = {
	map = map,
	maplocal = maplocal,
	toggle = toggle,
}

--
-- Autocommands
--
local function augroup(name)
	return vim.api.nvim_create_augroup("Jev" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

_G.event = {
	augroup = augroup,
	autocmd = autocmd,
}
