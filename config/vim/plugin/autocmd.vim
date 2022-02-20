augroup Miscellaneous
    autocmd!
    autocmd VimResized * wincmd =
    autocmd QuickFixCmdPost * cwindow
    autocmd Filetype gitcommit setl spell
    autocmd Filetype netrw setl bufhidden=delete
augroup End

augroup Templates
    autocmd!
    autocmd BufNewFile *.html silent 0read $VIMDOTDIR/.templates/index.html
    autocmd BufNewFile *.java silent 0read $VIMDOTDIR/.templates/Class.java
augroup End
