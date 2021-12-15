" Depths color file 
" Author: Alexis Moins
" Creation: 15 dec 2021

" {{{ Initialization 

set background=dark

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "test"

" }}}

" {{{ Highlighting Groups 

hi Normal           ctermfg=15          ctermbg=0
hi EndOfBuffer      ctermfg=0           ctermbg=0               cterm=none

hi LineNr           ctermfg=8           ctermbg=0

hi StatusLine                           ctermbg=7               cterm=none
hi StatusLineNC     ctermfg=8           ctermbg=0               cterm=none

hi User1                                ctermbg=11
hi User2            ctermfg=1           ctermbg=7
hi User3            ctermfg=11          ctermbg=7


hi! link VertSplit           EndOfBuffer

hi! link Folded              LineNr

hi! link CursorLine          StatusLine
hi! link CursorLineNr        StatusLine
hi! link Visual              StatusLine

" }}}

" {{{ Syntax Groups

hi Type             ctermfg=6
hi Constant         ctermfg=11
hi Statement        ctermfg=1
hi Number           ctermfg=5
hi String           ctermfg=12
hi Function         ctermfg=2
hi Delimiter        ctermfg=15
hi Comment          ctermfg=8


hi! link Structure       Type
hi! link StorageClass    Type
hi! link Todo            Type

hi! link Identifier      Constant
hi! link Tag             Constant

hi! link PreProc         Statement
hi! link PreCondit       Statement
hi! link Include         Statement
hi! link Keyword         Statement
hi! link Define          Statement
hi! link Typedef         Statement
hi! link Exception       Statement
hi! link Conditional     Statement
hi! link Repeat          Statement
hi! link Error           Statement
hi! link Operator        Statement
hi! link Title           Statement

hi! link Float           Number
hi! link Macro           Number
hi! link Label           Number
hi! link Special         Number
hi! link SpecialChar     Number
hi! link Boolean         Number

hi! link Character       String

hi! link SpecialComment  Comment

" }}}

" {{{ Language Specific Highlighting 

" zsh
hi! link zshOption      Number
hi! link zshCommands    Function
hi! link zshTypes       Function
hi! link zshSubst       Delimiter
hi! link zshQuoted      Constant

" vim
hi! link vimCommentTitle    Delimiter
hi! link vimOption          Delimiter
hi! link vimEnvVar          Function

" }}}
