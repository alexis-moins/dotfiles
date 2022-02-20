" Colorscheme definition
" Author: Alexis Moins
" Creation: 02 novembre 2020

" Initialization {{{

highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "depths"
let s:palette = depths#ColorPalette()

" Private function 
function! s:Hi(group, style)
	let s:list = [ "highlight",   a:group,
				\ "guifg=",		(has_key(a:style, "fg")		?	a:style.fg[0]	:	"NONE"),
				\ "ctermfg=",	(has_key(a:style, "fg")		?	a:style.fg[1]   :	"NONE"),
				\ "guibg=",		(has_key(a:style, "bg")		?	a:style.bg[0]   :	"NONE"),
				\ "ctermbg=",	(has_key(a:style, "bg")		?	a:style.bg[1]   :	"NONE"),
				\ "cterm=",		(has_key(a:style, "style")	?	a:style.style	:	"NONE"),
				\ "term=",		(has_key(a:style, "style")	?	a:style.style	:	"NONE"),
				\ ]
	execute join(s:list)
endfunction

" Highlight groups anytime, anywhere
function! depths#Highlight(group, style)
	call s:Hi(a:group, a:style)
endfunction

" }}}

" Highlighting Groups {{{

call s:Hi("Normal",     { "fg": s:palette.white })
call s:Hi("NonText",    { "fg": s:palette.lightBlue })

call s:Hi("CursorLine",     { "bg": s:palette.visual })
call s:Hi("CursorLineNr",   { "fg": s:palette.white,    "bg": s:palette.visual })
call s:Hi("ColorColumn",	{ "bg": s:palette.red })

call s:Hi("LineNr",         { "fg": s:palette.grey })
call s:Hi("EndOfBuffer",    { "fg": s:palette.background })
call s:Hi("MatchParen",     { "fg": s:palette.red })

call s:Hi("StatusLine",     { "fg": s:palette.white,    "bg": s:palette.visual })
call s:Hi("StatusLineNC",   { "fg": s:palette.grey,     "bg": s:palette.background })

call s:Hi("User1",      { "bg": s:palette.orange })
call s:Hi('User2',      { "fg": s:palette.red,          "bg": s:palette.visual })
call s:Hi("User3",      { "fg": s:palette.orange,       "bg": s:palette.visual })

call s:Hi("StatusLineTerm",     { "fg": s:palette.white,    "bg": s:palette.visual })
call s:Hi("StatusLineTermNC",   { "fg": s:palette.grey,     "bg": s:palette.background })
" call s:Hi("QuickFixLine", s:palette.none, s:palette.none)
" call s:Hi("qfFileName", s:palette.lightGreen, s:palette.none)

call s:Hi("WildMenu",			{ "fg": s:palette.background, "bg": s:palette.purple })
" call Hi("TabLine", s:palette.grey, s:palette.none)
" call Hi("TabLineSel", s:palette.black, s:palette.lightGreen)
" call Hi("TabLineFill", s:palette.black, s:palette.none)

call s:Hi("MatchParen",		{ "fg": s:palette.blue, "style": "underline" })
" call s:Hi("IncSearch", s:palette.none, s:palette.lightVisual)
" call s:Hi("Search", s:palette.none, s:palette.lightVisual)
call s:Hi("Visual",			{ "bg": s:palette.visual })

call s:Hi("Pmenu", 			{ "fg": s:palette.white, "bg": s:palette.visual })
call s:Hi("PmenuSel",		{ "fg": s:palette.background, "bg": s:palette.purple })
call s:Hi("PmenuSbar", 		{ "bg": s:palette.visual })
call s:Hi("PmenuThumb",		{ "bg": s:palette.grey })

" call s:Hi("Title", s:palette.purple, s:palette.none)
call s:Hi("Directory",		{ "fg": s:palette.cyan })
" call s:Hi("SpecialKey", s:palette.lightBlue, s:palette.none)

call s:Hi("VertSplit",      { "fg": s:palette.grey })
" call s:Hi("SpellBad", s:palette.white, s:palette.red)
" call s:Hi("SignColumn", s:palette.black, s:palette.black)

call s:Hi("Folded", { "fg": s:palette.grey  })
" call s:Hi("FoldColumn", s:palette.grey, s:palette.black)

" call s:Hi("Question", s:palette.lightGreen, s:palette.black)
" call s:Hi("MoreMsg", s:palette.lightGreen, s:palette.black)
call s:Hi("ModeMsg",		{ "fg": s:palette.lightGreen })

call s:Hi("DiffAdd",		{ "fg": s:palette.lightGreen })
call s:Hi("DiffText",		{ "fg": s:palette.purple })
call s:Hi("DiffChange",		{ "fg": s:palette.lightBlue })
call s:Hi("DiffDelete",		{ "fg": s:palette.red })

" }}}

" Syntax Groups {{{

call s:Hi("Comment", { "fg": s:palette.grey })
call s:Hi("Constant", { "fg": s:palette.cyan })

call s:Hi("String", { "fg": s:palette.lightBlue })
call s:Hi("Character", { "fg": s:palette.lightBlue })

call s:Hi("Number", { "fg": s:palette.orange }) 
call s:Hi("Boolean", { "fg": s:palette.red }) 
call s:Hi("Float", { "fg": s:palette.orange }) 

call s:Hi("Identifier", { "fg": s:palette.red }) 
call s:Hi("Function", { "fg": s:palette.blue }) 
call s:Hi("Statement", { "fg": s:palette.purple }) 
call s:Hi("Conditional", { "fg": s:palette.purple }) 
call s:Hi("Repeat", { "fg": s:palette.purple }) 
call s:Hi("Label", { "fg": s:palette.purple }) 
call s:Hi("Operator", { "fg": s:palette.cyan }) 
call s:Hi("Keyword", { "fg": s:palette.red }) 
call s:Hi("Exception", { "fg": s:palette.purple }) 
call s:Hi("PreProc", { "fg": s:palette.lightOrange }) 
call s:Hi("Include", { "fg": s:palette.blue }) 
call s:Hi("Define", { "fg": s:palette.purple }) 
call s:Hi("Macro", { "fg": s:palette.purple }) 
call s:Hi("PreCondit", { "fg": s:palette.lightOrange }) 
call s:Hi("Type", { "fg": s:palette.lightOrange }) 
call s:Hi("StorageClass", { "fg": s:palette.lightOrange }) 
call s:Hi("Structure", { "fg": s:palette.lightOrange }) 
call s:Hi("Typedef", { "fg": s:palette.lightOrange }) 
call s:Hi("Special", { "fg": s:palette.blue }) 
call s:Hi("SpecialChar", {}) 
call s:Hi("Tag", {}) 
call s:Hi("Delimiter", {}) 
call s:Hi("SpecialComment", { "fg": s:palette.grey }) 
call s:Hi("Debug", {}) 
call s:Hi("Underlined", {}) 
call s:Hi("Ignore", {}) 
call s:Hi("Error", { "fg": s:palette.red }) 
call s:Hi("Todo", { "fg": s:palette.purple })

" }}}

" {{{ Language-Specific Highlighting

" Vim
" call s:Hi("vimSynType",     { "fg": s:palette.lightGreen })
" call s:Hi("vimFTOption",    { "fg": s:palette.lightGreen })

" }}}

" {{{ Plugin Highlighting

" " coc.nvim
" call s:Hi("CocErrorSign",       s:palette.red,          s:palette.none)
" call s:Hi("CocWarningSign",     s:palette.orange,       s:palette.none)
" call s:Hi("CocHintSign",        s:palette.lightGreen,   s:palette.none)
" call s:Hi("CocInfoSign",        s:palette.lightBlue,    s:palette.none)

" }}}

set background=dark
