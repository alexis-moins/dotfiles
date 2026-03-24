-- vim: fdm=marker fdl=0 fdls=0
--
-- ┌─────────────────┐
-- │ Custom mappings │
-- └─────────────────┘
--
-- This file contains definitions of custom general and Leader mappings.

-- General ====================================================================

-- Use this section to add custom general mappings. See `:h vim.keymap.set()`.
local map, maplocal = Config.map, Config.maplocal

map("i", "jk", "<Esc>", "Leave insert mode")
map("n", "<C-E>", "<C-^>", "Edit alternate file")

map("n", "<Tab>", "<Cmd>tabnext<CR>", "Navigate to next tab")
map("n", "<S-Tab>", "<Cmd>tabprevious<CR>", "Navigate to previous tab")

map("n", "<BS>", "<Cmd>nohlsearch<CR>", "Clear search highlighting")
map("n", "<Leader>so", "<Cmd>source %<CR>", "Source current file")

map("n", "<Leader>o", "mP<cmd>sil %bd<bar>e #<bar>bd #<CR>'P", "Close all buffers but current one")
map("n", "<Leader>-", "<Cmd>bdelete<CR>", "Delete the current buffer")

map({ "n", "v" }, "L", "g$", "Go to the end of the line (respects wrap)")

map({ "n", "v" }, "j", "gj", "Move down (respects wrap)")
map({ "n", "v" }, "k", "gk", "Move up (respects wrap)")

map("n", "<C-U>", "{", "Scroll upwards (center)")
map("n", "<C-D>", "}", "Scroll downwards (center)")

map("n", "n", "nzz", "Repeat last search (center)")
map("n", "N", "Nzz", "Repeat last search in opposite direction (center)")

map({ "n", "x" }, "gy", '"+y', "Copy (+register)")

map({ "n", "x" }, "gp", '"+p', "Paste after cursor (+register)")
map({ "n", "x" }, "gP", '"+P', "Paste before cursor (+register)")

map("n", "c*", '*``"_cgn', "Replace word under cursor (dot repeatable)")
map("n", "c#", '#``"_cgN', "Backward replace word under cursor (dot respeatable)")

map("n", "d*", '*``"_dgn', "Delete word under cursor (dot repeatable)")
map("n", "d#", '#``"_dgN', "Backward delete word under cursor (dot respeatable)")

map("n", "H", "<Cmd>lua vim.diagnostic.open_float()<CR>", "Open diagnostic popup")

map("n", "g.", ":%s/<C-R><C-W>//gc<left><left><left>", "Substitute cword in buffer")
map("v", "g.", '"zy:%s/<C-R>z//gc<left><left><left>', "Substitute cword in buffer")

map("n", "<Leader>cd", "<Cmd>cd %:h<CR>", "Set working directory to current file's directory")

map("n", "<Leader>pu", "<Cmd>lua vim.pack.update()<CR>")

-- Toggle =====================================================================

local function toggle(option)
    return function()
        local opt = vim.opt_local[option]:get()
        vim.opt_local[option] = not opt
    end
end

map("n", [[\w]], toggle("wrap"), "Toggle line wrapping")
map("n", [[\n]], toggle("number"), "Toggle line number")
map("n", [[\s]], toggle("spell"), "Toggle spell checking")

map("n", [[\d]], "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle diff overlay")
map("n", [[\g]], "<Cmd>lua MiniDiff.toggle()<CR>", "Toggle git signs")

map("n", [[\q]], function()
    for _, win in pairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            -- Close quickfix window if opened
            vim.cmd.cclose()
            return
        end
    end

    vim.cmd.copen()
end, "Toggle quickfix")

-- {{{ LSP (<Leader>l)

Config.new_autocmd("LspAttach", nil, function(args)
    maplocal("n", "<Leader>ld", "<Cmd>Pick lsp scope='definition'<CR>", "Go to definition")
    maplocal("n", "<Leader>lr", "<Cmd>Pick lsp scope='references'<CR>", "Go to references")

    maplocal("n", "<Leader>lt", "<Cmd>Pick lsp scope='type_definition'<CR>", "Go to type definitions")

    maplocal("n", "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Execute code action")
    maplocal("n", "<Leader>ln", "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol under cursor")

    maplocal("n", "<Leader>lO", "<Cmd>Pick lsp scope='document_symbol'<CR>", "Find document symbol")

    maplocal("n", "<Leader>lw", '<Cmd>Pick diagnostic scope="all"<CR>', "Find workspace diagnostic")

    maplocal("n", "<Leader>lD", '<Cmd>Pick diagnostic scope="current"<CR>', "Find buffer diagnostic")

    -- maplocal("n", "<Leader>lw", "<Cmd>Pick lsp scope='workspace_symbol'<CR>", "Find workspace symbol")

    maplocal("n", "<Leader>lR", "<Cmd>LspRestart<CR>", "Restart LSP")
    maplocal("n", "<Leader>li", "<Cmd>LspInfo<CR>", "Show LSP info")
end)

-- }}}

-- Plugins ====================================================================

map("n", "<Leader><Space>", "<Cmd>Pick files<CR>", "Find files")
map("n", "<C-b>", "<Cmd>Pick buffers<CR>", "Find buffers")

map("n", "<Leader>*", "<Cmd>Pick resume<CR>", "Resume last picker")

map("n", "<Leader>fg", "<Cmd>Pick grep_live<CR>", "Grep files")

map({ "n", "v" }, "<Leader>*", "<Cmd>Pick grep pattern='<cword>'<CR>", "Grep <cword>")

-- map("n", "<Leader>z", MiniPick.builtin.resume, "Resume last picker")

map("n", "<Leader>fk", "<Cmd>Pick keymaps<CR>", "Find keymaps")
map("n", "<Leader>fh", "<Cmd>Pick help<CR>", "Find help")

-- map("n", "z=", MiniExtra.pickers.spellsuggest, "Find spelling")

map("n", "-", "<Cmd>lua MiniFiles.open(vim.fn.expand('%'))<CR>", "Open file explorer")
map("n", "+", "<Cmd>lua MiniFiles.open()<CR>", "Open file explorer (cwd)")

map("n", "=", "<Cmd>lua require('conform').format()<CR>", "Format file")

-- {{{ Git (<Leader>g)

map("n", "<Leader>gu", "<Cmd>Pick git_files scope='modified'<CR>", "Find unstaged files")
map("n", "<Leader>gs", "<Cmd>Pick git_files scope='staged'<CR>", "Find staged files")
map("n", "<Leader>gU", "<Cmd>Pick git_files scope='untracked'<CR>", "Find untracked files")

-- }}}
