--- Creates a mapping with a description
---
---@param modes string|table
---@param keys string
---@param action string|function
---@param description string
local function map(modes, keys, action, description)
	local opts = { desc = description }
	return vim.keymap.set(modes, keys, action, opts)
end

--- Creates a buffer local mapping with the a description
---
---@param modes string|table
---@param keys string
---@param action string|function
---@param description string
---@param buffer integer|boolean
local function maplocal(modes, keys, action, description, buffer)
	local opts = { desc = description, buffer = buffer }
	return vim.keymap.set(modes, keys, action, opts)
end

--- Returns a function that toggles a vim option.
--- Meant to be used in conjunction with the map function.
---
---@param option string
local function toggle(option)
    return function()
        local opt = vim.opt_local[option]:get()
        vim.opt_local[option] = not opt
    end
end

--
-- Mappings
--
map("i", "jk", "<C-C>", "Leave insert mode")

map("n", "/", "ms/", "Search a pattern forward")
map("n", "?", "ms?", "Search a pattern backward")

map("n", "<C-S>", "`s", "Go back to before search")

map("n", "<BS>", vim.cmd.nohlsearch, "Clear search highlighting")
map("n", "<Leader>so", vim.cmd.source, "Source current file")

map("n", "<Leader>o", vim.cmd.only, "Close all splits")
map("n", "<Leader>-", vim.cmd.bdelete, "Delete the current buffer")

map("n", "<Leader>q", vim.cmd.copen, "Open/focus the quickfix list")
map({ "n", "v" }, "j", "gj", "Move down (respects wrap)")
map({ "n", "v" }, "k", "gk", "Move up (respects wrap)")
map("n", "Q", "@qj", "Play macro")
map("x", "Q", "<cmd>norm @q<cr>", "Play macro")

-- Stay in place
map("n", "J", "mzJ`z", "Join line below without moving cursor")

-- Easier line navigation
map("n", "L", "$", "Go to the end of the line")

map("n", "]]", "<cmd>edit #<cr>", "Edit alternate file")
map("n", "<C-U>", "<C-U>zz", "Scroll upwards (center)")
map("n", "<C-D>", "<C-D>zz", "Scroll downwards (center)")
map("n", "n", "nzz", "Repeat last search (center)")
map("n", "N", "Nzz", "Repeat last search in opposite direction (center)")
map({ "n", "x" }, "gy", '"+y', "Copy (+register)")
map({ "n", "x" }, "gp", '"+p', "Paste after cursor (+register)")
map({ "n", "x" }, "gP", '"+P', "Paste before cursor (+register)")

local function _10_()
	return _G.MiniExtra.pickers.history({ scope = ":" })
end

map("n", "<Leader>fc", _10_, "Filter command history")
local function _11_()
	return _G.MiniExtra.pickers.buf_lines({ scope = "current" })
end
map("n", "<Leader>/", _11_, "Find lines")

-- map({ "n", "i" }, "<C-P>", MiniExtra.pickers.registers, "Find registers")
-- Insert blank lines
map("n", "[<Space>", "mzO<esc>`z", "Insert a line above cursor")
map("n", "]<Space>", "mzo<esc>`z", "Insert a line below cursor")

--
-- Option toggling
--

-- Numbers on the left
map("n", "|n", toggle("number"), "Toggle line number")
map("n", "|r", toggle("relativenumber"), "Toggle relative line number")

map("n", "|c", toggle("cursorline"), "Toggle cursorline")
map("n", "|l", toggle("list"), "Toggle list chararcters")

-- Wrap lines that are longer than 'textwidth'
map("n", "|w", toggle("wrap"), "Toggle line wrapping")

-- Spelling errors and suggestions
map("n", "|s", toggle("spell"), "Toggle spell checking")

local helpers = {
	map = map,
	maplocal = maplocal,
	toggle = toggle,
}

return helpers
