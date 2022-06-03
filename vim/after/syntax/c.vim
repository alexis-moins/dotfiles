syn match _Arrow        "\->"
syn match _Operator     "[\*+\-\~!%=&\^|?:]"
syn match _Function     "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cParen,cCppParen

hi! link _Arrow         Constant
hi! link _Operator      Operator
hi! link _Function      Function

hi! link cInclude       Comment
hi! link cIncluded      Special
