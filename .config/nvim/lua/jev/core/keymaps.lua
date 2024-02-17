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
map("n", "J", "mzJ`z", "Join line below without moving cursor")
map("n", "L", "$", "Go to the end of the line")
map("n", "]]", "<cmd>edit #<cr>", "Edit alternate file")
map("n", "<C-U>", "<C-U>zz", "Scroll upwards (center)")
map("n", "<C-D>", "<C-D>zz", "Scroll downwards (center)")
map("n", "n", "nzz", "Repeat last search (center)")
map("n", "N", "Nzz", "Repeat last search in opposite direction (center)")
map({ "n", "x" }, "gy", '"+y', "Copy (+register)")
map({ "n", "x" }, "gp", '"+p', "Paste after cursor (+register)")
map({ "n", "x" }, "gP", '"+P', "Paste before cursor (+register)")
local function _1_()
	local function _2_(_2410)
		return _G.MiniSessions.write(_2410)
	end
	return vim.ui.input({ prompt = "Session name: " }, _2_)
end
map("n", "<Leader>ss", _1_, "Write a new session")
local function _3_()
	return _G.MiniSessions.select("write")
end
map("n", "<Leader>sw", _3_, "Write a session")
local function _4_()
	return _G.MiniSessions.write("Session.vim")
end
map("n", "<Leader>sl", _4_, "Write a local session")
local function _5_()
	return _G.MiniSessions.select("read")
end
map("n", "<Leader>sr", _5_, "Read a session")
local function _6_()
	return _G.MiniSessions.select("delete")
end
map("n", "<Leader>sd", _6_, "Delete a session")
local function _7_()
	return _G.MiniPick.builtin.buffers()
end
map("n", "<Leader>fb", _7_, "Find buffers")
local function _8_()
	return _G.MiniPick.builtin.help()
end
map("n", "<Leader>fh", _8_, "Find help")
local function _9_()
	return _G.MiniPick.builtin.grep_live()
end
map("n", "<Leader>fg", _9_, "Find content")
local function _10_()
	return _G.MiniExtra.pickers.history({ scope = ":" })
end
map("n", "<Leader>fc", _10_, "Filter command history")
local function _11_()
	return _G.MiniExtra.pickers.buf_lines({ scope = "current" })
end
map("n", "<Leader>/", _11_, "Find lines")
local function _12_()
	return _G.MiniExtra.pickers.diagnostic({ scope = "current" })
end
map("n", "<Leader>d", _12_, "Find diagnostics (current)")
local function _13_()
	return _G.MiniExtra.pickers.diagnostic({ scope = "all" })
end
map("n", "<Leader>w", _13_, "Find diagnostics (all)")

map({ "n", "i" }, "<C-P>", MiniExtra.pickers.registers, "Find registers")

local function _15_()
	return _G.MiniVisits.select_path(nil, { filter = "core" })
end
map("n", "<Leader>v", _15_, "Select core (cwd)")
local function _16_()
	return _G.MiniVisits.select_path("", { filter = "core" })
end
map("n", "<Leader>V", _16_, "Select core (all)")
local function _17_()
	return _G.MiniVisits.add_label("core")
end
map("n", "<Leader>la", _17_, "Add to core")
local function _18_()
	return _G.MiniVisits.remove_label("core")
end
map("n", "<Leader>ld", _18_, "Remove from core")

-- Insert blank lines
map("n", "[<Space>", "mzO<esc>`z", "Insert a line above cursor")
map("n", "]<Space>", "mzo<esc>`z", "Insert a line below cursor")

-- Terminal
map("n", "<Leader>tt", vim.cmd.terminal, "Open a terminal")
map("n", "<Leader>ts", "<cmd>horizontal terminal<cr>", "Open a terminal in a split")
local function toggle(option)
    return function()
        local opt = vim.opt_local[option]:get()
        vim.opt_local[option] = not opt
    end
end

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

-- Set global Keymaps
_G.JevKeys = helpers

return helpers
