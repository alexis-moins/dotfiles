func! utils#FoldText()
    let title = substitute(getline(v:foldstart), "^ *", "", 1)
    let text = substitute(title, "", "", 1) 
    let text .= ' }}}'
    return text
endfunc

func! utils#Tabline()
    let s = ''
    for i in range(tabpagenr('$'))
        let tab = i + 1
        let winnr = tabpagewinnr(tab)
        let buflist = tabpagebuflist(tab)
        let bufnr = buflist[winnr - 1]
        let bufname = bufname(bufnr)
        let bufmodified = getbufvar(bufnr, "&mod")

        let s .= '%' . tab . 'T'
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= (bufname != '' ? ' ' . fnamemodify(bufname, ':t') . ' ' : ' No Name ')
    endfor

    let s .= '%#TabLineFill#'
    return s
endfunc

func! utils#SyntaxGroup()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
