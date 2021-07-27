" Chevron + d : Insère une balise div
" Chevron + a : Insère une balise aside
" Chevron + s : Insère une balise section
inoremap <buffer> <d <div><CR></div><ESC>O
inoremap <buffer> <a <aside><CR></aside><ESC>O
inoremap <buffer> <s <section><CR></section><ESC>O

inoremap <buffer> <1 <h1></h1><ESC>cit
inoremap <buffer> <p <p></p><ESC>cit

inoremap <buffer> <i <img src="" alt="<++>"><ESC>%ci"

" ==== Racourcis [NORMAL] ====
" Espace + Espace  : Prochain token
" Espace + cl  : Insere un tag class
" Espace + id  : Insere un tag id
nnoremap <buffer> <Space><Space> /<++><C-l><CR>"_c4l
nnoremap <buffer> <Space>cl 0f<ea class=""<ESC>i
nnoremap <buffer> <Space>id 0f<ea id=""<ESC>i

nnoremap <silent> <buffer> <leader>open <Cmd>silent !open %<CR>
