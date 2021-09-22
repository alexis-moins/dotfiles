func! s:Encoding()
    let encoding = &fenc ? &fenc : &enc
    return '(' . encoding . ')'
endfunc

func! sonar#Statusline()
    let statusline = '%1* %0*  ' .
                \ '%f  %2*%m%=%0*  %3*' .
                \ s:Encoding() . '%0*' . '  %Y '
    return statusline
endfunc

func! sonar#Quickfix()
    let statusline = '%1* %0*  ' .
                \ 'Quickfix  %2*%m%=%0*  %3*' .
                \ s:Encoding() . '%0*' . '  %Y '
    return statusline
endfunc
