" css.vim - fichier (utilisateur) de syntax pour css
" Auteur : Alexis Moins
" Création : 3 novembre 2020

" Écrase le lien défini dans ${VIMRUNTIME}/syntax/css.vim (!)
" et le lie au groupe de coloration 'Identifier'
hi! link cssBraces Identifier

hi! link cssClassName Structure
hi! link cssClassNameDot Structure
hi! link cssIdentifier Structure

hi! link cssProp Function
