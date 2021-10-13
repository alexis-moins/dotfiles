func! sonar#Statusline()
    let statusline = '%1* %0*  ' .
                \ '%f  %2*%m%=%0*  %3*  {%Y} '
    return statusline
endfunc

func! sonar#Quickfix()
    let statusline = '%1* %0*  ' .
                \ 'Quickfix  %2*%m%=%0*  %3*  {%Y} '
    return statusline
endfunc
