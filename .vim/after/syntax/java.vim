" " Define better operators
" syntax match _Operator "[+\-\~!%=&\^|?:]"

" " Define functions' highlighting
" syntax match _Paren "?=(" contains=cParen,cCppParen,_Function
" syntax match _Function "\.\s*\w\+\s*(\@=" contains=_Operator,_Paren

" " Links elements to syntax groups
" hi! link _Operator      Statement
" hi! link _Function      Type
" hi! link javaDocTags    Constant
" hi! link javaTypedef    Debug

" highlight! link javaClassDecl Red
" highlight! link javaMethodDecl Red
" highlight! link javaVarArg Fg
" highlight! link javaAnnotation Purple
" highlight! link javaUserLabel Purple
" highlight! link javaTypedef OrangeItalic
" highlight! link javaParen Fg
" highlight! link javaParen1 Fg
" highlight! link javaParen2 Fg
" highlight! link javaParen3 Fg
" highlight! link javaParen4 Fg
" highlight! link javaParen5 Fg
