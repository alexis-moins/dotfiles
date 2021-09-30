" Define better operators
syntax match _Operator "[+\-\~!%=&\^|?:]"

hi! link _Operator      Statement

hi! link cInclude  Constant
hi! link cIncluded Identifier

hi! link cDefine        Statement
hi! link cPreCondit     Statement
