" Modification de la coloration syntaxique
hi! link htmlArg 			Todo
hi! link htmlTag 			Identifier
hi! link htmlTagName 		Statement
hi! link htmlSpecialChar 	Constant

hi! link htmlValue 			Normal
hi! link htmlSpecial 		Normal
hi! link htmlStatement 		Normal

hi! link htmlTitle Normal
hi! link htmlH1 Normal
hi! link htmlLink Normal

" Ajout des balises manquantes
syn keyword htmlTagName contained svg path

" Ajout des attributs manquants
syn keyword htmlArg contained viewBox fill d
