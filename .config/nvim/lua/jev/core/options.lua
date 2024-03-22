--- Sets a neovim option.
---@param name string
---@param value any
local function opt(name, value)
	vim.opt[name] = value
end

-- Use 24-bit colors
opt("termguicolors", true)

-- Use tweaked version of catppuccin
vim.cmd.colorscheme("catppuccin-macchiato")

-- Always display sign column (diagnostics...)
opt("signcolumn", "yes")

-- Highlight current line
opt("cursorline", true)

-- Line numbers
opt("number", true)
opt("relativenumber", true)

-- More natural split directions
opt("splitbelow", true)
opt("splitright", true)

-- [wrap] Break at word boundaries and keep indent
opt("linebreak", true)
opt("breakindent", true)

-- Use global undo history and disable swap files
opt("undofile", true)
opt("swapfile", false)

-- Use a global statusline
opt("laststatus", 3)

-- Disable 'ruler' and 'showmode' options
opt("cmdheight", 0)
opt("showcmd", false)

-- Format of the winbar
opt("winbar", "%=%S%#Error#%m %#Comment#%t %#Function#%y")

-- [search] Ignore case unless uppercase is used
opt("smartcase", true)
opt("ignorecase", true)

-- Use 4 spaces for tabs
opt("tabstop", 4)
opt("shiftwidth", 4)
opt("expandtab", true)

-- Keep 8 characters before and after the cursor
opt("scrolloff", 8)
opt("sidescrolloff", 8)

-- Disable intro message and various info
opt("shortmess", "atToOCFWIc")

-- [spell] Work with english and french
opt("spelllang", { "en", "fr" })

-- Wait undefinitely for keymaps
opt("timeout", false)

-- Display list charaters
opt("list", true)

-- Characters to fill various places
opt("fillchars", { fold = " ", foldclose = "›", foldsep = " ", eob = " ", diff = "╱" })

-- Characters used in 'list' mode
opt("listchars", {
	tab = "· ",
	trail = "—",
	extends = "…",
	precedes = "…",
	eol = "↴",
	nbsp = "␣",
})

-- Manually define folds with 'zf'
opt("foldmethod", "manual")

-- Show folds hints only if there is at least 1
opt("foldcolumn", "0")

-- Use treesitter to highlight folded text
opt("foldexpr", "v:lua.vim.treesitter.foldexpr()")
opt("foldtext", "v:lua.vim.treesitter.foldtext()")

local function set_global(name, value)
	vim.g[name] = value
end

set_global("mapleader", " ")
set_global("maplocalleader", ";")

return { opt = opt, set_global = set_global }
