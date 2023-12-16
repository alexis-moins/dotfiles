-- [nfnl] Compiled from fnl/jev/core/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
local function map(modes, lhs, rhs, desc)
  local opts = {desc = desc}
  return vim.keymap.set(modes, lhs, rhs, opts)
end
local function map_local(modes, lhs, rhs, desc)
  local opts = {desc = desc, buffer = true}
  return vim.keymap.set(modes, lhs, rhs, opts)
end
map("i", "jk", "<C-C>", "Leave insert mode")
map("n", "<BS>", vim.cmd.nohlsearch, "Clear search highlighting")
map("n", "<Leader>so", vim.cmd.source, "Source current file")
map("n", "<Leader>o", vim.cmd.only, "Close all splits")
map("n", "<Leader>-", vim.cmd.bdelete, "Delete the current buffer")
map("n", "<Leader>q", vim.cmd.copen, "Open/focus the quickfix list")
map({"n", "v"}, "j", "gj", "Move down (respects wrap)")
map({"n", "v"}, "k", "gk", "Move up (respects wrap)")
map("n", "Q", "@qj", "Play macro")
map("x", "Q", "<cmd>norm @q<cr>", "Play macro")
map("n", "J", "mzJ`z", "Join line below without moving cursor")
map("n", "L", "$", "Go to the end of the line")
map("n", "]]", "<cmd>edit #<cr>", "Edit alternate file")
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
  return _G.MiniPick.builtin.files()
end
map("n", "<Leader><Space>", _7_, "Find files")
local function _8_()
  return _G.MiniPick.builtin.resume()
end
map("n", "<Leader>z", _8_, "Resume last picker")
local function _9_()
  return _G.MiniPick.builtin.buffers()
end
map("n", "<Leader>fb", _9_, "Find buffers")
local function _10_()
  return _G.MiniPick.builtin.help()
end
map("n", "<Leader>fh", _10_, "Find help")
local function _11_()
  return _G.MiniPick.builtin.grep_live()
end
map("n", "<Leader>fg", _11_, "Find content")
local function _12_()
  return _G.MiniExtra.pickers.history({scope = ":"})
end
map("n", "<Leader>fc", _12_, "Find command")
local function _13_()
  return _G.MiniExtra.pickers.buf_lines({scope = "current"})
end
map("n", "<Leader>/", _13_, "Find lines")
local function _14_()
  return _G.MiniExtra.pickers.registers()
end
map({"n", "i"}, "<C-P>", _14_, "Find registers")
local function _15_()
  return _G.MiniVisits.select_path(nil, {filter = "core"})
end
map("n", "<Leader>v", _15_, "Select core (cwd)")
local function _16_()
  return _G.MiniVisits.select_path("", {filter = "core"})
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
map("n", "[<Space>", "mzO<esc>`z", "Insert a line above cursor")
map("n", "]<Space>", "mzo<esc>`z", "Insert a line below cursor")
map("n", "<Leader>tt", vim.cmd.terminal, "Open a terminal")
map("n", "<Leader>ts", "<cmd>horizontal terminal<cr>", "Open a terminal in a split")
map("t", "<esc>", "<C-\\><C-N>", "Leave terminal mode")
map("t", "<C-^>", "<C-\\><C-N><C-O>", "Leave terminal mode and jump to last buffer")
local function toggle(option)
  vim.o[option] = not vim.o[option]
  return nil
end
local function _19_()
  return toggle("number")
end
map("n", "|n", _19_, "Toggle line number")
local function _20_()
  return toggle("relativenumber")
end
map("n", "|r", _20_, "Toggle relative line number")
local function _21_()
  return toggle("cursorline")
end
map("n", "|c", _21_, "Toggle cursorline")
local function _22_()
  return toggle("list")
end
map("n", "|l", _22_, "Toggle list chararcters")
local function _23_()
  return toggle("wrap")
end
map("n", "|w", _23_, "Toggle line wrapping")
local function _24_()
  return toggle("spell")
end
map("n", "|s", _24_, "Toggle spell checking")
return {map = map, ["map-local"] = map_local, toggle = toggle}
