syn keyword _ClassVar       self cls mcs super
syn keyword _ClassKeyword   class nextgroup=_Class skipwhite
syn match   _Class          '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*' display contained

hi! def link _ClassVar      Label
hi! def link _ClassKeyword  Repeat
hi! def link _Class         Identifier

syn match   _Operator       '\V=\|-\|+\|*\|/\|%\|&\||\|^\|~\|<\|>\|!=\|:='
syn match   _FunctionCall   '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'
syn keyword _FunctKeyword   def nextgroup=pythonFunction skipwhite

hi! def link _Operator      Statement
hi! def link _FunctionCall  Special

hi! def link _FunctKeyword  Repeat
hi! def link pythonFunction Identifier

syn match _IndentError   '^\s*\%( \t\|\t \)\s*\S'me=e-1 display
syn match _SpaceError    '\s\+$' display

hi! def link _IndentError   SpellBad 
hi! def link _SpaceError    SpellBad 

syn keyword _None           None
syn keyword _Boolean        True False

hi! def link _None          Constant
hi! def link _Boolean       Constant

hi! def link pythonDecoratorName    Constant
hi! def link pythonDecorator        Constant
hi! def link pythonEscape           Constant

syn match   _StringFormat "{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonRawString
syn region  _StringRegion matchgroup=_StringFormat start="{" end="\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" extend contained containedin=_Fstring,pythonRawFString contains=_StringRegion,@pythonExpression
syn match   _StringFormat "{{\|}}" contained containedin=_Fstring,pythonRawFString

syn region _Fstring   start=+[fF]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region _Fstring   start=+[fF]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
syn region _Fstring   start=+[fF]'''+ skip=+\\'+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
syn region _Fstring   start=+[fF]"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell

hi! def link _Fstring       String
