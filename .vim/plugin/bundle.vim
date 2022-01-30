" List of coc extensions installed at first startup
let g:coc_global_extensions = [ 
            \ 'coc-pairs', 
            \ 'coc-java',
            \ 'coc-clangd',
            \ 'coc-pyright'
            \ ]

" Cache la bannière
let g:netrw_banner=0
"
" Ouvre les splits à droite
let g:netrw_altv=1

" Tree view
let g:netrw_liststyle=3

" Where to save the history file
let g:netrw_home="${VIMDOTDIR}/.cache/netrwhist"

" Sequence for sorting by name
let g:netrw_sort_sequence='[\/]$,*'

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p85%,70%' }
else
  let g:fzf_layout = { 'down': '40%' }
endif
