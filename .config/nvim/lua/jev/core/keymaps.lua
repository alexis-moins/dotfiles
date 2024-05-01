keys.map("i", "jk", "<Esc>", "Leave insert mode")

keys.map("n", "/", "ms/", "Search a pattern forward")
keys.map("n", "?", "ms?", "Search a pattern backward")

keys.map("n", "<C-S>", "`s", "Go back to before search")

keys.map("n", "<BS>", vim.cmd.nohlsearch, "Clear search highlighting")
keys.map("n", "<Leader>so", vim.cmd.source, "Source current file")

keys.map("n", "<Leader>o", vim.cmd.only, "Close all splits")
keys.map("n", "<Leader>-", vim.cmd.bdelete, "Delete the current buffer")

keys.map("n", "<Leader>q", vim.cmd.copen, "Open/focus the quickfix list")
keys.map({ "n", "v" }, "j", "gj", "Move down (respects wrap)")
keys.map({ "n", "v" }, "k", "gk", "Move up (respects wrap)")

-- Play @q macro and move to next line (recusrive)
keys.map("n", "Q", "@qj", "Play macro")
keys.map("x", "Q", "<cmd>norm @q<cr>", "Play macro")

-- Stay in place
keys.map("n", "J", "mzJ`z", "Join line below without moving cursor")

-- Easier line navigation
keys.map("n", "L", "$", "Go to the end of the line")
keys.map("v", "L", "$", "Go to the end of the line (visual)")

keys.map("n", "<C-E>", "<cmd>edit #<cr>", "Edit alternate file")
keys.map("n", "<C-U>", "<C-U>zz", "Scroll upwards (center)")
keys.map("n", "<C-D>", "<C-D>zz", "Scroll downwards (center)")
keys.map("n", "n", "nzz", "Repeat last search (center)")
keys.map("n", "N", "Nzz", "Repeat last search in opposite direction (center)")
keys.map({ "n", "x" }, "gy", '"+y', "Copy (+register)")
keys.map({ "n", "x" }, "gp", '"+p', "Paste after cursor (+register)")
keys.map({ "n", "x" }, "gP", '"+P', "Paste before cursor (+register)")

--
-- Terminal keymaps
--
keys.map("t", "<esc>", "<C-\\><C-N>", "Leave terminal mode")
keys.map("t", "<C-^>", "<C-\\><C-N><C-O>", "Leave terminal mode and jump to last buffer")
keys.map("t", "<C-w>", "<C-\\><C-N><C-w>", "")

keys.map("n", "<Leader>ts", "<cmd>horizontal terminal<cr>", "Open a terminal in a horizontal split")
keys.map("n", "<Leader>tv", "<cmd>vertical terminal<cr>", "Open a terminal in a vertical split")

-- Insert blank lines
keys.map("n", "[<Space>", "mzO<esc>`z", "Insert a line above cursor")
keys.map("n", "]<Space>", "mzo<esc>`z", "Insert a line below cursor")

--
-- Option toggling
--

-- Numbers on the left
keys.map("n", "|n", keys.toggle("number"), "Toggle line number")
keys.map("n", "|r", keys.toggle("relativenumber"), "Toggle relative line number")

keys.map("n", "|c", keys.toggle("cursorline"), "Toggle cursorline")
keys.map("n", "|l", keys.toggle("list"), "Toggle list chararcters")

-- Wrap lines that are longer than 'textwidth'
keys.map("n", "|w", keys.toggle("wrap"), "Toggle line wrapping")

-- Spelling errors and suggestions
keys.map("n", "|s", keys.toggle("spell"), "Toggle spell checking")
