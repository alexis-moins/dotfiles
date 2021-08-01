" Colorscheme definition
" Author: Alexis Moins
" Creation: 02 novembre 2020

highlight clear

let g:colors_name = "sonar"
let g:palette = sonar#ColorPalette()

" {{{ Highlighting

call sonar#Highlight("Normal", g:palette.white, g:palette.black)
call sonar#Highlight("NonText", g:palette.lightBlue, g:palette.black)

call sonar#Highlight("Cursor", g:palette.none, g:palette.none)
call sonar#Highlight("CursorLine", g:palette.none, g:palette.none)
call sonar#Highlight("CursorLineNr", g:palette.white, g:palette.none)
call sonar#Highlight("ColorColumn", g:palette.red, g:palette.black)

call sonar#Highlight("LineNr", g:palette.grey, g:palette.black)
call sonar#Highlight("EndOfBuffer", g:palette.black, g:palette.black)

call sonar#Highlight("StatusLine", g:palette.lightGrey, g:palette.lightBlack)
call sonar#Highlight("StatusLineNC", g:palette.lightVisual, g:palette.black)

call sonar#Highlight("User1", g:palette.blue, g:palette.blue)
call sonar#Highlight('User2', g:palette.red, g:palette.lightBlack)
call sonar#Highlight("User3", g:palette.magenta, g:palette.lightBlack)

call sonar#Highlight("StatusLineTerm", g:palette.lightGrey, g:palette.lightBlack)
call sonar#Highlight("StatusLineTermNC", g:palette.lightVisual, g:palette.black)
call sonar#Highlight("QuickFixLine", g:palette.none, g:palette.none)
call sonar#Highlight("qfFileName", g:palette.lightGreen, g:palette.none)

call sonar#Highlight("WildMenu", g:palette.black, g:palette.blue)
call sonar#Highlight("TabLine", g:palette.lightVisual, g:palette.none)
call sonar#Highlight("TabLineSel", g:palette.black, g:palette.lightGreen)
call sonar#Highlight("TabLineFill", g:palette.black, g:palette.none)

call sonar#Highlight("MatchParen", g:palette.none, g:palette.none)
call sonar#Highlight("IncSearch", g:palette.none, g:palette.lightVisual)
call sonar#Highlight("Search", g:palette.none, g:palette.lightVisual)
call sonar#Highlight("Visual", g:palette.none, g:palette.lightBlack)

call sonar#Highlight("Pmenu", g:palette.white, g:palette.lightBlack)
call sonar#Highlight("PmenuSel", g:palette.black, g:palette.magenta)
call sonar#Highlight("PmenuSbar", g:palette.lightBlack, g:palette.lightBlack)
call sonar#Highlight("PmenuThumb", g:palette.lightGrey, g:palette.lightGrey)

call sonar#Highlight("Title", g:palette.magenta, g:palette.none)
call sonar#Highlight("Directory", g:palette.cyan, g:palette.none)
call sonar#Highlight("SpecialKey", g:palette.lightBlue, g:palette.none)

call sonar#Highlight("VertSplit", g:palette.grey, g:palette.none)
call sonar#Highlight("SpellBad", g:palette.white, g:palette.red)
call sonar#Highlight("SignColumn", g:palette.black, g:palette.black)

call sonar#Highlight("Folded", g:palette.grey, g:palette.black)
call sonar#Highlight("FoldColumn", g:palette.grey, g:palette.black)

call sonar#Highlight("Question", g:palette.lightGreen, g:palette.black)
call sonar#Highlight("MoreMsg", g:palette.lightGreen, g:palette.black)
call sonar#Highlight("ModeMsg", g:palette.lightGreen, g:palette.black)

call sonar#Highlight("DiffAdd", g:palette.lightGreen, g:palette.none)
call sonar#Highlight("DiffText", g:palette.magenta, g:palette.none)
call sonar#Highlight("DiffChange", g:palette.lightBlue, g:palette.none)
call sonar#Highlight("DiffDelete", g:palette.red, g:palette.none)

" }}}

" {{{ Syntax

call sonar#Highlight("Comment", g:palette.grey, g:palette.black)

call sonar#Highlight("Constant", g:palette.magenta, g:palette.black)
call sonar#Highlight("String", g:palette.yellow, g:palette.black)
call sonar#Highlight("Character", g:palette.yellow, g:palette.black)
call sonar#Highlight("Number", g:palette.magenta, g:palette.black)
call sonar#Highlight("Float", g:palette.magenta, g:palette.black)
call sonar#Highlight("Boolean", g:palette.magenta, g:palette.black)

call sonar#Highlight("Identifier", g:palette.white, g:palette.black)
call sonar#Highlight("Function", g:palette.lightBlue, g:palette.black)

call sonar#Highlight("Statement", g:palette.red, g:palette.black)
call sonar#Highlight("Conditional", g:palette.lightBlue, g:palette.black)
call sonar#Highlight("Repeat", g:palette.green, g:palette.black)
call sonar#Highlight("Label", g:palette.orange, g:palette.black)
call sonar#Highlight("Operator", g:palette.red, g:palette.black)
call sonar#Highlight("Keyword", g:palette.red, g:palette.black)
call sonar#Highlight("Exception", g:palette.lightBlue, g:palette.black)

call sonar#Highlight("PreProc", g:palette.white, g:palette.black)
call sonar#Highlight("Include", g:palette.red, g:palette.black)
call sonar#Highlight("Define", g:palette.red, g:palette.black)
call sonar#Highlight("Macro", g:palette.magenta, g:palette.black)
call sonar#Highlight("PreCondit", g:palette.magenta, g:palette.black)

call sonar#Highlight("Type", g:palette.cyan, g:palette.black)
call sonar#Highlight("StorageClass", g:palette.green, g:palette.black)
call sonar#Highlight("Structure", g:palette.green, g:palette.black)
call sonar#Highlight("Typedef", g:palette.green, g:palette.black)

call sonar#Highlight("Special", g:palette.cyan, g:palette.black)
call sonar#Highlight("SpecialChar", g:palette.red, g:palette.black)
call sonar#Highlight("Tag", g:palette.red, g:palette.black)
call sonar#Highlight("Delimiter", g:palette.white, g:palette.black)
call sonar#Highlight("SpecialComment", g:palette.grey, g:palette.black)
call sonar#Highlight("Debug", g:palette.orange, g:palette.black)

call sonar#Highlight("Underlined", g:palette.cyan, g:palette.black)
call sonar#Highlight("Ignore", g:palette.cyan, g:palette.black)

call sonar#Highlight("Error", g:palette.red, g:palette.black)
call sonar#Highlight("ErrorMsg", g:palette.red, g:palette.black)
call sonar#Highlight("TODO", g:palette.white, g:palette.black)

" }}}

" {{{ Links

" {{{ netrw

hi! default link netrwExe       Statement
hi! default link netrwSymLink   Constant
hi! default link netrwLink      PreProc
hi! default link netrwClassify  SignColumn

" }}}

" {{{ vimHelp

hi! link helpNote           Structure
hi! link helpSpecial        Statement
hi! link helpHyperTextEntry Constant

" }}}

" {{{ markdown

hi! link markdownBoldItalic             Special 
hi! link markdownBoldItalicDelimiter    Special
hi! link markdownHeadingDelimiter       Constant 

hi! link markdownBold               Debug
hi! link markdownBoldDelimiter      Debug
hi! link markdownItalic             Debug
hi! link markdownItalicDelimiter    Debug

" }}}

" }}}
