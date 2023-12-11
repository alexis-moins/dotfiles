-- [nfnl] Compiled from fnl/jev/core/options.fnl by https://github.com/Olical/nfnl, do not edit.
local function opt(name, value)
  vim.opt[name] = value
  return nil
end
opt("termguicolors", true)
opt("signcolumn", "yes")
opt("cursorline", true)
opt("number", true)
opt("relativenumber", true)
opt("splitbelow", true)
opt("splitright", true)
opt("linebreak", true)
opt("breakindent", true)
opt("undofile", true)
opt("swapfile", false)
opt("laststatus", 3)
opt("cmdheight", 0)
opt("showcmd", false)
opt("winbar", "%=%S%#Error#%m %#Comment#%P %#Function#%y")
opt("smartcase", true)
opt("ignorecase", true)
opt("tabstop", 4)
opt("shiftwidth", 4)
opt("expandtab", true)
opt("scrolloff", 8)
opt("sidescrolloff", 8)
opt("shortmess", "atToOCFWIc")
opt("spelllang", {"en", "fr"})
opt("timeout", false)
opt("list", true)
opt("fillchars", {fold = " ", foldclose = "\226\128\186", foldsep = " ", eob = " ", diff = "\226\149\177"})
opt("listchars", {tab = "\194\183 ", trail = "\226\128\148", extends = "\226\128\166", precedes = "\226\128\166", eol = "\226\134\180", nbsp = "\226\144\163"})
opt("foldmethod", "manual")
opt("foldcolumn", "auto:1")
opt("foldexpr", "v:lua.vim.treesitter.foldexpr()")
opt("foldtext", "v:lua.vim.treesitter.foldtext()")
local function set_global(name, value)
  vim.g[name] = value
  return nil
end
set_global("mapleader", " ")
set_global("maplocalleader", ";")
return {opt = opt, ["set-global"] = set_global}
