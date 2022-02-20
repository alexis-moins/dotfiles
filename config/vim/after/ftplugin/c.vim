" Define the compiler (better errorformat)
compiler gcc

" Add support for assertion errors
set errorformat^=%*[^:]:\ %f:%l:%*[^:]:%m
let &efm .= ',%+GIn file included from %f:%l%*[\,:]'
