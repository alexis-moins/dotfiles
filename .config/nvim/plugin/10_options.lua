-- Use `<Space>` as <Leader> key
vim.g.mapleader = " "

-- Wait undefinitely for keymaps
vim.o.timeout = false

vim.o.switchbuf = "usetab" -- Use already opened buffers when switching

-- Enable persistent undo
vim.o.undofile = true

-- Disable swapfiles

vim.o.swapfile = false
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

-- Keep at least 8 lines above/below the cursor
vim.o.scrolloff = 8

-- Keep at least 8 columns to the left/right of the cursor
vim.o.sidescrolloff = 8

-- Enable all filetype plugins and syntax (if not enabled, for better startup)
vim.cmd("filetype plugin indent on")

if vim.fn.exists("syntax_on") ~= 1 then
    vim.cmd("syntax enable")
end

-- Draw column on the right of maximum width
vim.o.colorcolumn = "+1"

-- Enable current line highlighting
vim.o.cursorline = true

-- Don't visually wrap lines (toggle with \w)
vim.o.wrap = false

-- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.linebreak = true

-- Indent wrapped lines to match line start
vim.o.breakindent = true

-- Add padding for lists (if 'wrap' is set)
vim.o.breakindentopt = "list:-1"

-- Never show a status line
vim.o.laststatus = 0

-- Empty the status line because it is still used as a separator for horizontal splits
vim.o.statusline = " "

-- Set the content of the window bar
vim.o.winbar = "%= %#PmenuSel# %t%m "

-- Show helpful text indicators (toggle with \l)
vim.o.list = true

-- Don't show line numbers (toggle with \n)
vim.o.number = false

-- Don't show cursor coordinates
vim.o.ruler = false

-- Don't show mode in command line
vim.o.showmode = false

-- Never show commands
vim.o.showcmd = false

-- Completely hide the command-line unless it is being used (EXPERIMENTAL)
-- vim.o.cmdheight = 0

vim.o.pumheight = 10 -- Make popup menu smaller

-- Disable some built-in completion messages
vim.o.shortmess = "CFOSWIaco"

-- Always show signcolumn (less flicker)
vim.o.signcolumn = "yes"

-- Horizontal splits will be below
vim.o.splitbelow = true

-- Vertical splits will be to the right
vim.o.splitright = true

-- Reduce scroll during window split
vim.o.splitkeep = "screen"

-- Use border in floating windows
vim.o.winborder = "single"

-- Show cursor line per screen line
vim.o.cursorlineopt = "screenline,number"

-- Symbols used to fill various UI elements
vim.opt.fillchars = { eob = " ", foldclose = "›", foldsep = " ", diff = "╱" }

-- Symbols used in list mode
vim.opt.listchars = { extends = "…", nbsp = "␣", precedes = "…", tab = "· ", trail = "—" }

-- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
vim.o.foldlevel = 10        -- Fold nothing by default; set to 0 or 1 to fold
vim.o.foldmethod = "indent" -- Fold based on indent level
vim.o.foldnestmax = 10      -- Limit number of fold levels
vim.o.foldtext = ""         -- Show text under fold with its highlighting

-- List of directories to search with :find, :sfind, :tabfind...
vim.o.path = ".,,**"

vim.o.formatoptions = "rqnl1j" -- Improve comment editing

-- Ignore case during search
vim.o.ignorecase = true

-- Respect case if search pattern has upper case
vim.o.smartcase = true

-- Show partial off-screen search-replace results in a preview window
-- vim.o.inccommand = 'split'

-- Infer case in built-in completion
vim.o.infercase = true

-- Use this number of spaces for indentation
vim.o.shiftwidth = 4

-- Show tab as this number of spaces
vim.o.tabstop = 4

-- Convert tabs to spaces
vim.o.expandtab = true

-- Use auto indent
vim.o.autoindent = true

-- Make indenting smart
vim.o.smartindent = true

-- Treat camelCase word parts as separate words
vim.o.spelloptions = "camel"

-- List of languages to spellcheck for
vim.opt.spelllang = { "en", "fr" }

-- Allow going past end of line in blockwise mode
vim.o.virtualedit = "block"

-- Treat dash as `word` textobject part
vim.opt.iskeyword:append("-")

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Use less completion sources
vim.opt.complete = { ".", "w", "b", "kspell" }

-- Use custom behavior
vim.opt.completeopt = { "menuone", "noselect", "fuzzy", "nosort" }

-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
local f = function()
    vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end
Config.new_autocmd("FileType", nil, f, "Proper 'formatoptions'")

-- Show cursorline when entering buffer or window
Config.new_autocmd({ "WinEnter", "BufEnter" }, nil, function()
    vim.wo.cursorline = true
end)

-- Hide cursorline when leaving buffer or window
Config.new_autocmd({ "WinLeave", "BufLeave" }, nil, function()
    vim.wo.cursorline = false
end)

Config.new_autocmd("TextYankPost", nil, function()
    vim.highlight.on_yank({
        higroup = "Visual",
        timeout = 200,
        on_visual = false,
    })
end)

Config.new_autocmd("VimResized", nil, function()
    vim.cmd("tabdo wincmd =")
end)

Config.new_autocmd("FileType", {
    "html",
    "vue",
    "javascript",
    "typescript",
}, function()
    MiniPairs.map_buf(0, "i", "<", { action = "open", pair = "<>", register = { cr = false } })
    MiniPairs.map_buf(0, "i", ">", { action = "close", pair = "<>", register = { cr = false } })
end)

-- Try to start treesitter for each filetype (silently)
Config.new_autocmd("FileType", "*", function()
    pcall(vim.treesitter.start)
end)

-- Diagnostics ================================================================

-- Neovim has built-in support for showing diagnostic messages. This configures
-- a more conservative display while still being useful.
-- See `:h vim.diagnostic` and `:h vim.diagnostic.config()`.
local diagnostic_opts = {
    -- Show signs on top of any other sign, but only for warnings and errors
    signs = { priority = 9999, severity = { min = "WARN", max = "ERROR" } },

    -- Show all diagnostics as underline (for their messages type `<Leader>ld`)
    underline = { severity = { min = "HINT", max = "ERROR" } },

    -- Show more details immediately for errors
    virtual_lines = false,
    virtual_text = {
        -- current_line = true,
        severity = { min = "ERROR", max = "ERROR" },
    },

    -- Don't update diagnostics when typing
    update_in_insert = true,
}

vim.diagnostic.config(diagnostic_opts)
