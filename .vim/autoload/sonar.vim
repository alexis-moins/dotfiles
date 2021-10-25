func! sonar#Statusline()
    let statusline = '%1* %0*  ' .
                \ '%t  %2*%m%=%0*  %{expand("%:h")}%3*  %y  '
    return statusline
endfunc

func! sonar#Quickfix()
    let statusline = '%1* %0*  ' .
                \ 'Quickfix  %2*%m%=%0*  %3*  %y  '
    return statusline
endfunc
