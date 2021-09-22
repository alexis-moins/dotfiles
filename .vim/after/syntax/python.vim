" +-- Better classes

syn keyword _ClassVar       self cls mcs super
syn keyword _ClassKeyword   class nextgroup=_Class skipwhite
syn match   _Class          '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*' display contained

" --+

" +-- Operators & functions

syn match   _Operator       '\V=\|-\|+\|*\|/\|%\|&\||\|^\|~\|<\|>\|!=\|:='
syn match   _FunctionCall   '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'
syn keyword _FunctKeyword   def nextgroup=pythonFunction skipwhite

" --+

" +-- Errors & booleans

syn match _SpaceError    '\s\+$' display
syn match _IndentError   '^\s*\%( \t\|\t \)\s*\S'me=e-1 display

syn keyword _None           None
syn keyword _Boolean        True False

" --+

" +-- Links elements to syntax groups

hi! def link _Class         Identifier
hi! def link _ClassVar      Label
hi! def link _ClassKeyword  Repeat

hi! def link _Operator      Statement
hi! def link _FunctionCall  Special

hi! def link _FunctKeyword  Repeat
hi! def link pythonFunction Identifier

hi! def link _SpaceError    SpellBad 
hi! def link _IndentError   SpellBad 

hi! def link _None          Constant
hi! def link _Boolean       Constant

hi! def link pythonEscape           Constant
hi! def link pythonDecorator        Constant
hi! def link pythonDecoratorName    Constant

" --+
