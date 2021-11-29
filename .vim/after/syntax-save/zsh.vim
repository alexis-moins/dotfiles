" Define better operators
syntax match _operator "[+;\-\~!%=&\^|?:]"

" Links elements to syntax groups
highlight! default link _operator      Statement
highlight! default link zshRepeat      Exception
highlight! default link zshPreProc     Comment
highlight! default link zshCommands    ModeMsg
highlight! default link zshTypes       ModeMsg
