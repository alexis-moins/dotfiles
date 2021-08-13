func! Mode()
    let modes = {
                \ 'n': 'Normal',
                \ 'v': 'Visual',
                \ 'i': 'Insert',
                \ 'V': 'Line',
                \ "\<C-V>": 'Block',
                \ 'R': 'Replace',
                \ 'r': 'Replace',
                \ 's': 'Select',
                \ 't': 'TerminaL',
                \ 'c': 'Command',
                \ '!': 'Shell'
                \ }
    return modes[mode()]
endfunc

func! s:Function(function)
    return '%{' . a:function . '()}'
endfunc

func! s:Encoding()
    let encoding = &fenc ? &fenc : &enc
    return '(' . encoding . ')'
endfunc

func! jev#Normal()
    let statusline = '%1* %0*  ' .
                \ '%f  %2*%m%=%0*  %3*' .
                \ s:Encoding() . '%0*' . '  %Y  '
    return statusline
endfunc

func! jev#Quickfix()
    let statusline = '%1* %0*  ' .
                \ 'Quickfix  %2*%m%=%0*' .
                \ s:Function('Mode') . '  %3*' .
                \ s:Encoding() . '%0*' . '  %Y  '
    return statusline
endfunc
