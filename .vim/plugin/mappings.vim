let mapleader = " " 

" Goes to the next / previous element of the quickfix list
nnoremap ]q <Cmd>cnext<CR>
nnoremap [q <Cmd>cprevious<CR>

" Goes to the next / previous element of the arglist
nnoremap ]a <Cmd>next<CR>
nnoremap [a <Cmd>previous<CR>

nnoremap <leader>cs :mks! .vim-session<CR>
nnoremap <leader>ss <Cmd>source .vim-session<CR>

nnoremap <leader>- <Cmd>edit %:p:h<CR><C-L>
nnoremap <leader>~ <Cmd>edit `pwd`<CR><C-L>

nnoremap <leader>qo <Cmd>copen<CR>
nnoremap <leader>qc <Cmd>cclose<CR>

nnoremap <leader>nu <Cmd>setl nu! nornu<CR>
nnoremap <leader>rnu <Cmd>setl rnu! nonu<CR>

nnoremap <leader>st :setl list!<CR>
nnoremap <leader>sp :setl spell!<CR>

nnoremap <leader>cd <Cmd>lcd %:p:h<CR>
nnoremap <leader>cb <Cmd>lcd -<CR>

" 
nnoremap <leader>rl :%s/<C-R><C-W>//gce<left><left><left><left>
nnoremap <leader>rg :argdo! %s/<C-R><C-W>//gce<left><left><left><left>

nnoremap <leader>src :source %<CR>
nnoremap <leader>syn <Cmd>call utils#SyntaxGroup()<CR>

nnoremap <leader>tn <Cmd>tabnew<CR>
nnoremap <leader>tc <Cmd>tabclose<CR>

nnoremap <leader>mk :silent make <Bar> silent redraw!<CR>
nnoremap <leader>op <Cmd>!open .<CR>

" Yanks until the end of the line
nnoremap Y y$

" Moves text around
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap <silent> <C-J> :m .+1<CR>==
nnoremap <silent> <C-K> :m .-2<CR>==

" Navigates between splits more easily
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Selects the first match in the spelling list
nnoremap <C-S> mp[s1z=`p
inoremap <C-S> <C-C>[s1z=`]a

nnoremap <leader>ind magg=G`a

iabbrev <expr> tdd strftime("%d %b %Y")
