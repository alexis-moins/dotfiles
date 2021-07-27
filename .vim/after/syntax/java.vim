" Define operators
syntax match _Operator "[+\-\~!%=&\^|?:]"

" Define functions
syntax match _Paren "?=(" contains=cParen,cCppParen,_Function
syntax match _Function "\.\s*\w\+\s*(\@=" contains=_Operator,_Paren

" Links groups to syntax groups
hi! link _Operator      Statement
hi! link _Function      Type
hi! link javaDocTags    Constant
hi! link javaTypedef    Debug
