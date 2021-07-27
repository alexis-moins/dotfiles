" Define operators
syntax match _operator "[+;\-\~!%=&\^|?:]"

" Linking custom groups
highlight! default link _operator      Statement

" Linking default groups
highlight! default link zshRepeat      Exception
highlight! default link zshPreProc     Comment
highlight! default link zshCommands    Special
