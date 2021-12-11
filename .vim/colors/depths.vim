" Depths colorscheme
" Author: Alexis Moins
" Creation: 02 novembre 2020

" Initialization {{{

highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name="depths"
let s:palette = depths#ColorPalette()

" Private function 
function! s:Hi(group, style)
	let s:list = [ "highlight",   a:group,
				\ "guifg=",		(has_key(a:style, "fg")		?	a:style.fg[0]	:	"NONE"),
				\ "ctermfg=",	(has_key(a:style, "fg")		?	a:style.fg[1]   :	"NONE"),
				\ "guibg=",		(has_key(a:style, "bg")		?	a:style.bg[0]   :	"NONE"),
				\ "ctermbg=",	(has_key(a:style, "bg")		? 	a:style.bg[1]   :	"NONE"),
				\ "cterm=NONE"  ]
	execute join(s:list)
endfunction

" Highlight groups anytime, anywhere
function! depths#Highlight(group, style)
	call s:Hi(a:group, a:style)
endfunction

" }}}

" Highlighting Groups {{{

call s:Hi("Normal", { "fg": s:palette.white })
call s:Hi("NonText", { "fg": s:palette.lightBlue })

" call s:Hi("Cursor", s:palette.none, s:palette.none)
call s:Hi("CursorLine",     { "bg": s:palette.visual })
call s:Hi("CursorLineNr",   { "fg": s:palette.white,    "bg": s:palette.visual })
" call s:Hi("ColorColumn", s:palette.red, s:palette.background)

call s:Hi("LineNr", { "fg": s:palette.grey })
" call s:Hi("EndOfBuffer", s:palette.background, s:palette.background)
" call s:Hi("MatchParen", s:palette.red, s:palette.background)

call s:Hi("StatusLine",     { "fg": s:palette.white,    "bg": s:palette.visual })
call s:Hi("StatusLineNC",   { "fg": s:palette.grey,     "bg": s:palette.background })

call s:Hi("User1", { "fg": s:palette.blue,      "bg": s:palette.blue })
call s:Hi('User2', { "fg": s:palette.red,       "bg": s:palette.visual })
call s:Hi("User3", { "fg": s:palette.magenta,   "bg": s:palette.visual })

" call s:Hi("StatusLineTerm", s:palette.lightGrey, s:palette.visual)
" call s:Hi("StatusLineTermNC", s:palette.grey, s:palette.background)
" call s:Hi("QuickFixLine", s:palette.none, s:palette.none)
" call s:Hi("qfFileName", s:palette.lightGreen, s:palette.none)

" call s:Hi("WildMenu", s:palette.background, s:palette.blue)
" call s:Hi("TabLine", s:palette.grey, s:palette.none)
" call s:Hi("TabLineSel", s:palette.background, s:palette.lightGreen)
" call s:Hi("TabLineFill", s:palette.background, s:palette.none)

" call s:Hi("MatchParen", s:palette.none, s:palette.none)
" call s:Hi("IncSearch", s:palette.none, s:palette.lightVisual)
" call s:Hi("Search", s:palette.none, s:palette.visual)
" call s:Hi("Visual", s:palette.none, s:palette.visual)

" call s:Hi("Pmenu", s:palette.white, s:palette.)
" call s:Hi("PmenuSel", s:palette.background, s:palette.magenta)
" call s:Hi("PmenuSbar", s:palette.visual, s:palette.visual)
" call s:Hi("PmenuThumb", s:palette.lightGrey, s:palette.lightGrey)

" call s:Hi("Title", s:palette.magenta, s:palette.none)
" call s:Hi("Directory", s:palette.cyan, s:palette.none)
" call s:Hi("SpecialKey", s:palette.lightBlue, s:palette.none)

" call s:Hi("VertSplit", s:palette.grey, s:palette.none)
" call s:Hi("SpellBad", s:palette.white, s:palette.red)
" call s:Hi("SignColumn", s:palette.background, s:palette.background)

" call s:Hi("Folded", s:palette.grey, s:palette.none)
" call s:Hi("FoldColumn", s:palette.grey, s:palette.background)

" call s:Hi("Question", s:palette.lightGreen, s:palette.background)
" call s:Hi("MoreMsg", s:palette.lightGreen, s:palette.background)
" call s:Hi("ModeMsg", s:palette.lightGreen, s:palette.background)

" call s:Hi("DiffAdd", s:palette.lightGreen, s:palette.none)
" call s:Hi("DiffText", s:palette.magenta, s:palette.none)
" call s:Hi("DiffChange", s:palette.lightBlue, s:palette.none)
" call s:Hi("DiffDelete", s:palette.red, s:palette.none)

" }}}

" Syntax Groups {{{

call s:Hi("Constant",      { "fg": s:palette.magenta })
call s:Hi("Number",        { "fg": s:palette.magenta })
call s:Hi("Float",         { "fg": s:palette.magenta })
call s:Hi("Boolean",       { "fg": s:palette.cyan })
call s:Hi("Character",     { "fg": s:palette.lightBlue })
call s:Hi("String",        { "fg": s:palette.lightBlue })

call s:Hi("Type",          { "fg": s:palette.lightGreen })
call s:Hi("Structure",     { "fg": s:palette.cyan })
call s:Hi("StorageClass",  { "fg": s:palette.red })
call s:Hi("Typedef",       { "fg": s:palette.cyan })
    
call s:Hi("Identifier",    { "fg": s:palette.green })
call s:Hi("Function",      { "fg": s:palette.magenta })
                         
call s:Hi("Statement",     { "fg": s:palette.blue })
call s:Hi("Operator",      { "fg": s:palette.red })
call s:Hi("Label",         { "fg": s:palette.red })
call s:Hi("Keyword",       { "fg": s:palette.cyan })
"        Conditional"
"        Repeat"
"        Exception"

call s:Hi("PreProc",       { "fg": s:palette.green })
call s:Hi("Include",       { "fg": s:palette.red })
call s:Hi("Define",        { "fg": s:palette.red })
call s:Hi("Macro",         { "fg": s:palette.green })
call s:Hi("PreCondit",     { "fg": s:palette.green })
                           
call s:Hi("Special",       { "fg": s:palette.magenta })
call s:Hi("SpecialChar",   { "fg": s:palette.red })
call s:Hi("Delimiter",     { "fg": s:palette.red })
call s:Hi("SpecialComment",{ "fg": s:palette.cyan })
call s:Hi("Tag",           { "fg": s:palette.red })
"        Debug"

call s:Hi("Todo",          { "fg": s:palette.orange})
call s:Hi("Comment",       { "fg": s:palette.grey})
                         
call s:Hi("Underlined",    { "fg": s:palette.green })
call s:Hi("Ignore",        {})
call s:Hi("Error",         { "fg": s:palette.red, "bg": s:palette.darkred })

" call s:Hi("Comment", s:palette.grey, s:palette.background)
" call s:Hi("Constant", s:palette.magenta, s:palette.background)

" call s:Hi("String", s:palette.lightBlue, s:palette.background)
" call s:Hi("Character", s:palette.lightBlue, s:palette.background)

" call s:Hi("Number", s:palette.lightMagenta, s:palette.background)
" call s:Hi("Float", s:palette.lightMagenta, s:palette.background)
" call s:Hi("Boolean", s:palette.lightMagenta, s:palette.background)

" call s:Hi("Identifier", s:palette.white, s:palette.background)
" call s:Hi("Function", s:palette.magenta, s:palette.background)

" call s:Hi("Statement", s:palette.red, s:palette.background)
" call s:Hi("Conditional", s:palette.lightBlue, s:palette.background)
" call s:Hi("Repeat", s:palette.lightGreen, s:palette.background)
" call s:Hi("Label", s:palette.lightGreen, s:palette.background)
" call s:Hi("Operator", s:palette.red, s:palette.background)
" call s:Hi("Keyword", s:palette.red, s:palette.background)
" call s:Hi("Exception", s:palette.lightBlue, s:palette.background)

" call s:Hi("PreProc", s:palette.white, s:palette.background)
" call s:Hi("Include", s:palette.red, s:palette.background)
" call s:Hi("Define", s:palette.red, s:palette.background)
" call s:Hi("Macro", s:palette.magenta, s:palette.background)
" call s:Hi("PreCondit", s:palette.magenta, s:palette.background)

" call s:Hi("Type", s:palette.cyan, s:palette.background)
" call s:Hi("StorageClass", s:palette.lightGreen, s:palette.background)
" call s:Hi("Structure", s:palette.red, s:palette.background)
" call s:Hi("Typedef", s:palette.red, s:palette.background)

" call s:Hi("Special", s:palette.lightRed, s:palette.background)
" call s:Hi("SpecialChar", s:palette.red, s:palette.background)
" call s:Hi("Tag", s:palette.red, s:palette.background)
" call s:Hi("Delimiter", s:palette.white, s:palette.background)
" call s:Hi("SpecialComment", s:palette.grey, s:palette.background)
" call s:Hi("Debug", s:palette.yellow, s:palette.background)

" call s:Hi("Underlined", s:palette.cyan, s:palette.background)
" call s:Hi("Ignore", s:palette.cyan, s:palette.background)

" call s:Hi("Error", s:palette.red, s:palette.background)
" call s:Hi("ErrorMsg", s:palette.red, s:palette.background)
" call s:Hi("TODO", s:palette.white, s:palette.background)

" }}}

" {{{ Language-Specific Highlighting

" " Vim
" call s:Hi("vimFTOption",    s:palette.lightGreen,   s:palette.none)
" call s:Hi("vimSynType",     s:palette.lightGreen,   s:palette.none)
" call s:Hi("vimContinue",    s:palette.yellow,       s:palette.none)

" " }}}

" " {{{ Plugin Highlighting

" " coc.nvim
" call s:Hi("CocErrorSign",       s:palette.red,          s:palette.none)
" call s:Hi("CocWarningSign",     s:palette.yellow,       s:palette.none)
" call s:Hi("CocHintSign",        s:palette.lightGreen,   s:palette.none)
" call s:Hi("CocInfoSign",        s:palette.lightBlue,    s:palette.none)

" " }}}

" set background=dark
