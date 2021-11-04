setlocal errorformat=%E%f:%l:\ error:\ %m%.%#,%W%f:%l:\ warning:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

inoremap <buffer> <C-Z>main public static void main(String[] args) {}<Left><CR><C-C>O
