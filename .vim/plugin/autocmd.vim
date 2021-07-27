augroup Miscellaneous
    autocmd!
    autocmd VimResized * wincmd =
    autocmd Filetype gitcommit setlocal spell
augroup End

augroup Filetype
    autocmd!
    autocmd BufNewFile,BufRead Brewfile set filetype=brewfile syntax=ruby
augroup END

augroup Templates
    autocmd!
    autocmd BufNewFile *.html silent 0read $VIMDOTDIR/.templates/index.html
    autocmd BufNewFile *.java silent 0read $VIMDOTDIR/.templates/Class.java
augroup End

augroup Linting
    autocmd!
    autocmd QuickFixCmdPost * cwindow
    autocmd BufWritePost *.java,*.javascript silent normal! magg=G`a
augroup End
