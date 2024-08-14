-- Use 24-bit colors
opt.set("termguicolors", true)

-- Use tweaked version of catppuccin
vim.cmd.colorscheme("catppuccin-macchiato")

-- Always display sign column (diagnostics...)
opt.set("signcolumn", "yes")

-- Highlight current line
opt.set("cursorline", true)

-- Line numbers
opt.set("number", true)
opt.set("relativenumber", true)

-- More natural split directions
opt.set("splitbelow", true)
opt.set("splitright", true)

-- [wrap] Break at word boundaries and keep indent
opt.set("linebreak", true)
opt.set("breakindent", true)

-- Use global undo history and disable swap files
opt.set("undofile", true)
opt.set("swapfile", false)

-- Use a global statusline
opt.set("laststatus", 3)

-- Disable 'ruler' and 'showmode' options
opt.set("cmdheight", 0)
opt.set("showcmd", false)

-- Format of the winbar
-- opt("winbar", "%=%S%#Error#%m %#Comment#%-0.30f %#Function#%y")
-- opt("winbar", "%=%S%#Error#%m %#Function#%y")
-- opt.set("winbar", " ")

-- [search] Ignore case unless uppercase is used
opt.set("smartcase", true)
opt.set("ignorecase", true)

-- Use 4 spaces for tabs
opt.set("tabstop", 4)
opt.set("shiftwidth", 4)
opt.set("expandtab", true)

-- Keep 8 characters before and after the cursor
opt.set("scrolloff", 8)
opt.set("sidescrolloff", 8)

-- Disable intro message and various info
opt.set("shortmess", "atToOCFWIc")

-- [spell] Work with english and french
opt.set("spelllang", { "en", "fr" })

-- Wait undefinitely for keymaps
opt.set("timeout", false)

opt.set("jumpoptions", { "stack", "view" })

-- Show command result in a split
opt.set("inccommand", "split")

-- Display list charaters
opt.set("list", true)

-- Characters to fill various places
opt.set("fillchars", { fold = " ", foldclose = "›", foldsep = " ", eob = " ", diff = "╱" })

-- Characters used in 'list' mode
opt.set("listchars", {
	tab = "· ",
	trail = "—",
	extends = "…",
	precedes = "…",
	eol = "↴",
	nbsp = "␣",
})

-- Conceal text
-- opt.set("conceallevel", 1)

-- opt.set("completeopt", { "menuone", "noinsert", "noselect", "fuzzy" })

-- Manually define folds with 'zf'
opt.set("foldmethod", "manual")

-- Show folds hints only if there is at least 1
opt.set("foldcolumn", "auto")

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = ""
-- vim.opt.foldcolumn = "0"
-- vim.opt.foldlevelstart = 0
-- vim.opt.foldnestmax = 2

-- Use treesitter to highlight folded text
opt.set("foldexpr", "v:lua.vim.treesitter.foldexpr()")
opt.set("foldtext", "")

opt.setglobal("mapleader", " ")
opt.setglobal("maplocalleader", " ")
