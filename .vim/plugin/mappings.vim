let mapleader = " " 

" Goes to the next / previous element of the arglist
nnoremap <Right> <Cmd>next<CR>
nnoremap <Left> <Cmd>previous<CR>

" Goes to the next / previous element of the quickfix list
nnoremap <Down> <Cmd>cnext<CR>
nnoremap <Up> <Cmd>cprevious<CR>

map gf <cmd>edit <cfile><cr>

nnoremap <leader>mk :silent make! <Bar> silent redraw!<CR>
nnoremap <leader>cs :mks! .vim-session<CR>
nnoremap <leader>ss <Cmd>source .vim-session<CR>

nnoremap - <Cmd>edit %:p:h<CR><C-L>
nnoremap + <Cmd>edit `pwd`<CR><C-L>

nnoremap <leader>nu <Cmd>setl nu! nornu<CR>
nnoremap <leader>rnu <Cmd>setl rnu! nonu<CR>

nnoremap <leader>cl <Cmd>setl cul!<CR>

nnoremap <leader>st :setl list!<CR>
nnoremap <leader>sp :setl spell!<CR>

nnoremap <leader>cd <Cmd>lcd %:p:h<CR>
nnoremap <leader>cb <Cmd>lcd -<CR>
" 
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>src :source %<CR>
nnoremap <leader>syn <Cmd>call utils#SyntaxGroup()<CR>

nnoremap <Tab> magg=G`a

" Yanks until the end of the line
nnoremap Y y$

" Kepp visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" Moves text around
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==

" Keep position after visually yanking 
vnoremap y mpy`p
vnoremap Y mpY`p

" Navigates between splits more easily
nmap <silent> <C-h> <C-W>h
nmap <silent> <C-j> <C-W>j
nmap <silent> <C-k> <C-W>k
nmap <silent> <C-l> <C-W>l

" Selects the first match in the spelling list
nnoremap <C-S> mp[s1z=`p
inoremap <C-S> <C-C>[s1z=`]a

iabbrev <expr> tdd strftime("%d %b %Y")

