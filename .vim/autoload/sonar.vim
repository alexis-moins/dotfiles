" Author: Alexis Moins
" Creation: 11 avr 2021

let s:palette = {
            \ 'black':       [234, "#1c1c1c"],
            \ 'red':         [197, "#ff005f"],
            \ 'green':       [77,  "#5fd700"],
            \ 'yellow':      [186, "#d7d787"],
            \ 'blue':        [75,  "#5fafff"],
            \ 'magenta':     [141, "#af87ff"],
            \ 'cyan':        [81,  "#5fd7ff"],
            \ 'white':       [252, "#dadada"],
            \ 'lightBlack':  [235, "#262626"],
            \ 'lightRed':    [203, "#af005f"],
            \ 'lightGreen':     [121, "#87ffaf"],
            \ 'orange':         [214, "#ffc24b"],
            \ 'lightBlue':      [153, "#b3deef"],
            \ 'lightMagenta':   [176, "#d787d7"],
            \ 'visual':         [236, "#262626"],
            \ 'lightVisual':    [240, "#585858"],
            \ 'grey':           [242, "#444444"],
            \ 'lightGrey':      [250, "#444444"],
            \ 'none':           ["NONE", "NONE"]
            \ }

func! sonar#ColorPalette()
    return s:palette
endfunc

func! sonar#Highlight(group, fg, bg, ...)
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
