" Define missing tags
syn keyword htmlTagName contained svg path

" Define missing attributes
syn keyword htmlArg contained viewBox fill d

" +-- Links elements to syntax groups
hi! link htmlArg 			Todo
hi! link htmlTag 			Identifier
hi! link htmlTagName 		Statement
hi! link htmlSpecialChar 	Constant

hi! link htmlValue 			Normal
hi! link htmlSpecial 		Normal
hi! link htmlStatement 		Normal

hi! link htmlH1     Normal
hi! link htmlLink   Normal
hi! link htmlTitle  Normal

" --+
