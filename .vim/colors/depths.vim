" Colorscheme definition
" Author: Alexis Moins
" Creation: 02 novembre 2020

" {{{ Initialization

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "sonokai"
let s:palette = depths#ColorPalette()

" Private function 
function! s:Hi(group, style)
    let s:list = [ "highlight",   a:group,
                \ "guifg=",     (has_key(a:style, "fg")     ?   a:style.fg[0]   :   "NONE"),
                \ "ctermfg=",   (has_key(a:style, "fg")     ?   a:style.fg[1]   :   "NONE"),
                \ "guibg=",     (has_key(a:style, "bg")     ?   a:style.bg[0]   :   "NONE"),
                \ "ctermbg=",   (has_key(a:style, "bg")     ?   a:style.bg[1]   :   "NONE"),
                \ "cterm=",     (has_key(a:style, "style")  ?   a:style.style   :   "NONE"),
                \ "term=",      (has_key(a:style, "style")  ?   a:style.style   :   "NONE"),
                \ ]
    execute join(s:list)
endfunction

" Highlight groups anytime, anywhere
function! depths#Highlight(group, style)
    call s:Hi(a:group, a:style)
endfunction

" }}}

" {{{ Highlighting Groups

call s:Hi('Normal',     { "fg": s:palette.white, "bg": s:palette.background })
call s:Hi('Terminal',   { "fg": s:palette.white, "bg": s:palette.background })

call s:Hi('EndOfBuffer',    { "fg": s:palette.background,   "bg": s:palette.background })
call s:Hi('Folded',         { "fg": s:palette.grey,         "bg": s:palette.background })
" call s:Hi('FoldColumn', s:palette.grey_dim, s:palette.none)

call s:Hi('SignColumn', { "bg": s:palette.background })
" call s:Hi('IncSearch', s:palette.bg0, s:palette.bg_red)
" call s:Hi('Search', s:palette.bg0, s:palette.bg_green)
" call s:Hi('ColorColumn', s:palette.none, s:palette.bg1)
" call s:Hi('Conceal', s:palette.grey_dim, s:palette.none)

call s:Hi('CursorLine',     { "bg": s:palette.visual })
call s:Hi('CursorColumn',   { "bg": s:palette.visual })
call s:Hi('LineNr',         { "fg": s:palette.grey })
call s:Hi('CursorLineNr',   { "fg": s:palette.white,    "bg": s:palette.visual })

call s:Hi("StatusLine",     { "fg": s:palette.white,    "bg": s:palette.visual })
call s:Hi("StatusLineNC",   { "fg": s:palette.grey,     "bg": s:palette.background })

call s:Hi("User1",      { "bg": s:palette.yellow })
call s:Hi('User2',      { "fg": s:palette.red,          "bg": s:palette.visual })
call s:Hi("User3",      { "fg": s:palette.yellow,       "bg": s:palette.visual })

" }}}

" {{{ Syntax Groups

call s:Hi('Type',           { "fg": s:palette.cyan })
call s:Hi('Structure',      { "fg": s:palette.cyan })
call s:Hi('StorageClass',   { "fg": s:palette.cyan })

call s:Hi('Identifier',     { "fg": s:palette.orange })
call s:Hi('Constant',       { "fg": s:palette.orange })

call s:Hi('PreProc',        { "fg": s:palette.red })
call s:Hi('PreCondit',      { "fg": s:palette.red })
call s:Hi('Include',        { "fg": s:palette.red })
call s:Hi('Keyword',        { "fg": s:palette.red })
call s:Hi('Define',         { "fg": s:palette.red })
call s:Hi('Typedef',        { "fg": s:palette.red })
call s:Hi('Exception',      { "fg": s:palette.red })
call s:Hi('Conditional',    { "fg": s:palette.red })
call s:Hi('Repeat',         { "fg": s:palette.red })
call s:Hi('Statement',      { "fg": s:palette.red })

call s:Hi('Operator',   { "fg": s:palette.orange })
call s:Hi('Title',      { "fg": s:palette.red })
call s:Hi('Error',      { "fg": s:palette.red })

call s:Hi('Macro',          { "fg": s:palette.purple })
call s:Hi('Label',          { "fg": s:palette.purple })
call s:Hi('Special',        { "fg": s:palette.purple })
call s:Hi('SpecialChar',    { "fg": s:palette.purple })

call s:Hi('String',     { "fg": s:palette.blue })
call s:Hi('Character',  { "fg": s:palette.blue })

call s:Hi('Number',         { "fg": s:palette.purple })
call s:Hi('Float',          { "fg": s:palette.purple })
call s:Hi('Boolean',        { "fg": s:palette.purple })

call s:Hi('Function',   { "fg": s:palette.green })
call s:Hi('Tag',        { "fg": s:palette.orange })
call s:Hi('Delimiter',  { "fg": s:palette.white })

call s:Hi('Comment',            { "fg": s:palette.grey })
call s:Hi('SpecialComment',     { "fg": s:palette.grey })
call s:Hi('Todo',               { "fg": s:palette.cyan })

call s:Hi('Ignore',         { "fg": s:palette.grey })
call s:Hi('Underlined',     { "style": 'underline' })

" }}}

" {{{ Language Specific Highlighting

" Vim
call s:Hi("vimCommentTitle",    { "fg": s:palette.white })
call s:Hi("vimOption",          { "fg": s:palette.white })
call s:Hi("vimEnvVar",        { "fg": s:palette.green })
call s:Hi("vimVar",        { "fg": s:palette.white })
call s:Hi("vimOper",        { "fg": s:palette.red })

" }}}

set background=dark
