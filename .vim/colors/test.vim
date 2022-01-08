" Depths syntax file
" Author: Alexis Moins
" Creation: 15 dec 2021
" Last Change: 20 dec 2021

" {{{ Initialization 

set background=dark

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "test"

" }}}

" {{{ Highlighting Groups 

hi Normal           ctermfg=7          ctermbg=0
hi EndOfBuffer      ctermfg=0           ctermbg=0               cterm=none
hi LineNr           ctermfg=8           ctermbg=0
hi CursorLine                           ctermbg=15              cterm=none

hi StatusLine       ctermfg=1           ctermbg=0               cterm=none
hi StatusLineNC     ctermfg=0           ctermbg=0               cterm=none

hi User1                                ctermbg=6
hi User2            ctermfg=8           ctermbg=0
hi User3            ctermfg=1           ctermbg=0
hi User4            ctermfg=0           ctermbg=0
hi User5            ctermfg=5           ctermbg=0
hi ModeMsg          ctermfg=2

hi DiffText         ctermfg=5           ctermbg=none
hi DiffChange       ctermfg=4           ctermbg=none
hi DiffDelete       ctermfg=1           ctermbg=none

hi SpellBad         ctermfg=1           ctermbg=none            cterm=underline
hi SpellCap         ctermfg=6           ctermbg=none            cterm=underline

hi TabLine                              ctermbg=15              cterm=none
hi TabLineSel       ctermfg=7
hi MatchParen       ctermfg=5           ctermbg=none            cterm=underline

hi Pmenu            ctermfg=7           ctermbg=15
hi PmenuSel         ctermfg=0           ctermbg=5
hi PmenuSbar        ctermbg=15


hi! link VertSplit      EndOfBuffer
hi! link TabLineFill    EndOfBuffer
hi! link SignColumn     EndOfBuffer

hi! link Folded         LineNr
hi! link DiffAdd        ModeMsg

hi! link CursorLineNr   CursorLine
hi! link Visual         CursorLine

" }}}

" {{{ Syntax Groups

hi Statement        ctermfg=1
hi Function         ctermfg=2
hi Constant         ctermfg=3
hi String           ctermfg=4
hi Number           ctermfg=5
hi Type             ctermfg=6
hi Delimiter        ctermfg=7
hi Comment          ctermfg=8


hi! link Structure       Type
hi! link StorageClass    Type
hi! link Directory       Type
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

" vim
hi! link vimOption          Delimiter
hi! link vimHiGroup         Delimiter
hi! link vimCommentTitle    Delimiter
hi! link vimEnvVar          Function
hi! link vimHiKeyList       Statement
hi! link vimHiCtermFgBg     Constant
hi! link vimHiCTerm         Constant
hi! link vimHiAttrib        Number

" netrw
hi! link netrwSymLink       Number
hi! link netrwLink          Comment
hi! link netrwClassify      Delimiter
hi! link netrwTreeBar       Delimiter

" coc
hi! link CocInfoSign        Type
hi! link CocHintSign        String
hi! link CocWarningSign     Constant
hi! link CocErrorSign       Statement

" gitcommit
hi! link gitcommitBlank           Delimiter
hi! link gitcommitSummary         Delimiter
hi! link gitcommitFirstLine       Statement
hi! link gitcommitHeader          Delimiter

" zsh
hi! link zshOption      Number
hi! link zshQuoted      Number
hi! link zshTypes       Function
hi! link zshCommands    Function
hi! link zshSubst       Delimiter

" haskell
hi! link haskellType                Type
hi! link haskellBrackets            Delimiter
hi! link haskellIdentifier          Constant
hi! link haskellDecl                Statement
hi! link haskellWhere               Statement
hi! link haskellDeriving            Statement
hi! link haskellDeclKeyword         Statement
hi! link haskellForeignKeywords     Statement

" }}}
