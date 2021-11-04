" ==== Racourcis [NORMAL] ====
" Espace + Espace  : Prochain token
" Espace + cl  : Insere un tag class
" Espace + id  : Insere un tag id
nnoremap <buffer> <Space><Space> /<++><C-l><CR>"_c4l
nnoremap <buffer> <Space>cl 0f<ea class=""<ESC>i
nnoremap <buffer> <Space>id 0f<ea id=""<ESC>i
