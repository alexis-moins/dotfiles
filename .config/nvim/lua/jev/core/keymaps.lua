-- [nfnl] Compiled from fnl/jev/core/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
local function map(modes, lhs, rhs, desc)
  local opts = {desc = desc}
  return vim.keymap.set(modes, lhs, rhs, opts)
end
map("i", "jk", "<C-C>", "Leave insert mode")
map("n", "<Leader><BS>", vim.cmd.nohlsearch, "Clear search highlighting")
map("n", "=", vim.lsp.buf.format, "Format file")
map("n", "<Leader>so", vim.cmd.source, "Source current file")
map("n", "<Leader>-", vim.cmd.bdelete, "Delete the current buffer")
map({"n", "v"}, "j", "gj", "Move down (respects wrap)")
map({"n", "v"}, "k", "gk", "Move up (respects wrap)")
map("n", "J", "mzJ`z", "Join line below without moving cursor")
map("n", "L", "$", "Go to the end of the line")
map("n", "<C-U>", "<C-U>zz", "Scroll upwards (center)")
map("n", "<C-D>", "<C-D>zz", "Scroll downwards (center)")
map("n", "n", "nzz", "Repeat last search (center)")
map("n", "N", "Nzz", "Repeat last search in opposite direction (center)")
map({"n", "x"}, "gy", "\"+y", "Copy (+register)")
map({"n", "x"}, "gp", "\"+p", "Paste after cursor (+register)")
map({"n", "x"}, "gP", "\"+P", "Paste before cursor (+register)")
local function _1_()
  local function _2_(_2410)
    return _G.MiniSessions.write(_2410)
  end
  return vim.ui.input({prompt = "Session name: "}, _2_)
end
map("n", "<Leader>ss", _1_, "Write a session")
local function _3_()
  return _G.MiniSessions.write("Session.vim")
end
map("n", "<Leader>sl", _3_, "Write a local session")
local function _4_()
  return _G.MiniSessions.select("read")
end
map("n", "<Leader>sr", _4_, "Read a session")
local function _5_()
  return _G.MiniSessions.select("delete")
end
map("n", "<Leader>sd", _5_, "Delete a session")
map("n", "[<Space>", "mzO<esc>`z", "Insert a line above cursor")
map("n", "]<Space>", "mzo<esc>`z", "Insert a line below cursor")
map("n", "<Leader>tt", vim.cmd.terminal, "Open a terminal")
map("n", "<Leader>ts", "<cmd>horizontal terminal<cr>", "Open a terminal in a split")
map("t", "<C-^>", "<C-\\><C-N><C-O>", "Leave terminal mode and jump to last buffer")
local function toggle(option)
  vim.o[option] = not vim.o[option]
  return nil
end
local function _6_()
  return toggle("number")
end
map("n", "|n", _6_, "Toggle line number")
local function _7_()
  return toggle("relativenumber")
end
map("n", "|r", _7_, "Toggle relative line number")
local function _8_()
  return toggle("cursorline")
end
map("n", "|c", _8_, "Toggle cursorline")
local function _9_()
  return toggle("list")
end
map("n", "|l", _9_, "Toggle list chararcters")
local function _10_()
  return toggle("wrap")
end
map("n", "|w", _10_, "Toggle line wrapping")
local function _11_()
  return toggle("spell")
end
map("n", "|s", _11_, "Toggle spell checking")
return {map = map, toggle = toggle}
