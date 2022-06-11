" Define better operators
syntax match _operator "[+;\-\~!%=&\^|?:]"

" Links elements to syntax groups
hi! default link _operator      Statement
