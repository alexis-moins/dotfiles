" Colorscheme definition
" Author: Alexis Moins
" Creation: 02 novembre 2020

highlight clear

let g:colors_name = "kraken"

" +-- Utils

" The color palette used globally
let g:palette = {
            \ 'black':       [0, "#1c1c1c"],
            \ 'red':         [9, "#ff005f"],
            \ 'green':       [77,  "#5fd700"],
            \ 'yellow':      [186, "#d7d787"],
            \ 'blue':        [4,  "#5fafff"],
            \ 'magenta':     [141, "#af87ff"],
            \ 'cyan':        [6,  "#5fd7ff"],
            \ 'white':       [252, "#dadada"],
            \ 'lightBlack':  [8, "#262626"],
            \ 'lightRed':    [9, "#af005f"],
            \ 'lightGreen':     [121, "#87ffaf"],
            \ 'orange':         [214, "#ffc24b"],
            \ 'lightBlue':      [12, "#b3deef"],
            \ 'lightMagenta':   [176, "#d787d7"],
            \ 'visual':         [236, "#262626"],
            \ 'lightVisual':    [240, "#585858"],
            \ 'grey':           [15, "#444444"],
            \ 'lightGrey':      [250, "#444444"],
            \ 'none':           ["NONE", "NONE"]
            \ }

" Mathod for highlighting a specific syntax group
func! Highlight(group, fg, bg, ...)
    if a:0 >= 2 && strlen(a:2)
        let style=a:2
    else
        let style='NONE'
    endif
    let hiList = [
                \ 'hi', a:group,
                \ 'ctermfg=' . a:fg[0],
                \ 'guifg=' . a:fg[1],
                \ 'ctermbg=' . a:bg[0],
                \ 'guibg=' . a:bg[1],
                \ 'cterm=' . style,
                \ 'gui=' . style,
                \ 'term=' . style
                \ ]
    execute join(hiList)
endfunc

" --+

" +-- Interface

call Highlight("Normal", g:palette.white, g:palette.black)
call Highlight("NonText", g:palette.lightBlue, g:palette.black)

call Highlight("Cursor", g:palette.none, g:palette.none)
call Highlight("CursorLine", g:palette.none, g:palette.lightBlack)
call Highlight("CursorLineNr", g:palette.white, g:palette.lightBlack)
call Highlight("ColorColumn", g:palette.red, g:palette.black)

call Highlight("LineNr", g:palette.grey, g:palette.black)
call Highlight("EndOfBuffer", g:palette.black, g:palette.black)
call Highlight("MatchParen", g:palette.red, g:palette.black)

call Highlight("StatusLine", g:palette.lightGrey, g:palette.lightBlack)
call Highlight("StatusLineNC", g:palette.grey, g:palette.black)

call Highlight("User1", g:palette.blue, g:palette.blue)
call Highlight('User2', g:palette.red, g:palette.lightBlack)
call Highlight("User3", g:palette.magenta, g:palette.lightBlack)

call Highlight("StatusLineTerm", g:palette.lightGrey, g:palette.lightBlack)
call Highlight("StatusLineTermNC", g:palette.grey, g:palette.black)
call Highlight("QuickFixLine", g:palette.none, g:palette.none)
call Highlight("qfFileName", g:palette.lightGreen, g:palette.none)

call Highlight("WildMenu", g:palette.black, g:palette.blue)
call Highlight("TabLine", g:palette.grey, g:palette.none)
call Highlight("TabLineSel", g:palette.black, g:palette.lightGreen)
call Highlight("TabLineFill", g:palette.black, g:palette.none)

call Highlight("MatchParen", g:palette.none, g:palette.none)
call Highlight("IncSearch", g:palette.none, g:palette.lightVisual)
call Highlight("Search", g:palette.none, g:palette.lightVisual)
call Highlight("Visual", g:palette.none, g:palette.lightBlack)

call Highlight("Pmenu", g:palette.white, g:palette.lightBlack)
call Highlight("PmenuSel", g:palette.black, g:palette.magenta)
call Highlight("PmenuSbar", g:palette.lightBlack, g:palette.lightBlack)
call Highlight("PmenuThumb", g:palette.lightGrey, g:palette.lightGrey)

call Highlight("Title", g:palette.magenta, g:palette.none)
call Highlight("Directory", g:palette.cyan, g:palette.none)
call Highlight("SpecialKey", g:palette.lightBlue, g:palette.none)

call Highlight("VertSplit", g:palette.grey, g:palette.none)
call Highlight("SpellBad", g:palette.white, g:palette.red)
call Highlight("SignColumn", g:palette.black, g:palette.black)

call Highlight("Folded", g:palette.grey, g:palette.black)
call Highlight("FoldColumn", g:palette.grey, g:palette.black)

call Highlight("Question", g:palette.lightGreen, g:palette.black)
call Highlight("MoreMsg", g:palette.lightGreen, g:palette.black)
call Highlight("ModeMsg", g:palette.lightGreen, g:palette.black)

call Highlight("DiffAdd", g:palette.lightGreen, g:palette.none)
call Highlight("DiffText", g:palette.magenta, g:palette.none)
call Highlight("DiffChange", g:palette.lightBlue, g:palette.none)
call Highlight("DiffDelete", g:palette.red, g:palette.none)

" --+

" +-- Syntax

call Highlight("Comment", g:palette.grey, g:palette.black)

call Highlight("Constant", g:palette.magenta, g:palette.black)
call Highlight("String", g:palette.lightBlue, g:palette.black)
call Highlight("Character", g:palette.lightBlue, g:palette.black)
call Highlight("Number", g:palette.magenta, g:palette.black)
call Highlight("Float", g:palette.magenta, g:palette.black)
call Highlight("Boolean", g:palette.orange, g:palette.black)

call Highlight("Identifier", g:palette.white, g:palette.black)
call Highlight("Function", g:palette.magenta, g:palette.black)

call Highlight("Statement", g:palette.red, g:palette.black)
call Highlight("Conditional", g:palette.lightBlue, g:palette.black)
call Highlight("Repeat", g:palette.green, g:palette.black)
call Highlight("Label", g:palette.orange, g:palette.black)
call Highlight("Operator", g:palette.red, g:palette.black)
call Highlight("Keyword", g:palette.red, g:palette.black)
call Highlight("Exception", g:palette.lightBlue, g:palette.black)

call Highlight("PreProc", g:palette.white, g:palette.black)
call Highlight("Include", g:palette.red, g:palette.black)
call Highlight("Define", g:palette.red, g:palette.black)
call Highlight("Macro", g:palette.magenta, g:palette.black)
call Highlight("PreCondit", g:palette.magenta, g:palette.black)

call Highlight("Type", g:palette.cyan, g:palette.black)
call Highlight("StorageClass", g:palette.green, g:palette.black)
call Highlight("Structure", g:palette.green, g:palette.black)
call Highlight("Typedef", g:palette.green, g:palette.black)

call Highlight("Special", g:palette.cyan, g:palette.black)
call Highlight("SpecialChar", g:palette.red, g:palette.black)
call Highlight("Tag", g:palette.red, g:palette.black)
call Highlight("Delimiter", g:palette.white, g:palette.black)
call Highlight("SpecialComment", g:palette.grey, g:palette.black)
call Highlight("Debug", g:palette.orange, g:palette.black)

call Highlight("Underlined", g:palette.cyan, g:palette.black)
call Highlight("Ignore", g:palette.cyan, g:palette.black)

call Highlight("Error", g:palette.red, g:palette.black)
call Highlight("ErrorMsg", g:palette.red, g:palette.black)
call Highlight("TODO", g:palette.white, g:palette.black)

" --+
