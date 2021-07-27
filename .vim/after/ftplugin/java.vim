setlocal errorformat=%E%f:%l:\ error:\ %m%.%#,%W%f:%l:\ warning:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

nnoremap <buffer> <Space><Space> /<++><CR><C-L>"_c4l

inoremap <buffer> <C-Z>if if (!) {}<Left><CR><C-C>k^f!xi
inoremap <buffer> <C-Z>out System.out.println();<Left><Left>

inoremap <buffer> <C-Z>for for (int i = 0; i !; i++) {}<Left><CR><C-C>k^f!xi
inoremap <buffer> <C-Z>str public String toString() {}<left><CR><C-C>Oreturn ;<Left>

inoremap <buffer> <C-Z>main public static void main(String[] args) {}<Left><CR><C-C>O
