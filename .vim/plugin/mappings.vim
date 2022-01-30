let mapleader = " " 

nnoremap <silent> [a :previous<CR>
nnoremap <silent> ]a :next<CR>

nnoremap <silent> <leader>ins <Cmd>PlugInstall<cr>
nnoremap <silent> <leader>clean <Cmd>PlugClean<cr>
nnoremap <silent> <leader>fin :FZF<CR>

nnoremap <silent> - :15Lex<CR>
nnoremap <silent> + :15Lex ~<CR>

map gf <cmd>edit <cfile><cr>

nnoremap <leader>rl :%s/<C-R><C-W>//gce<left><left><left><left>
nnoremap <leader>rf :%s/<C-R><C-W>//ge<left><left><left>
nnoremap <leader>rg :bufdo %s/<C-R><C-W>//gce<left><left><left><<left>

nnoremap <leader>mk :silent make! <Bar> silent redraw!<CR>
nnoremap <leader>cs :mks! .vim-session<CR>
nnoremap <leader>ss <Cmd>source .vim-session<CR>

" Toggle options
nnoremap ;cl <Cmd>setl cul!<CR>
nnoremap ;nu <Cmd>setl nu! nornu<CR>
nnoremap ;rnu <Cmd>setl rnu! nonu<CR>
nnoremap ;st :setl list!<CR>
nnoremap ;sp :setl spell!<CR>
nnoremap ;pa :set paste!<CR>

nnoremap <leader>cd :lcd %:p:h<CR>
nnoremap <leader>cb :lcd -<CR>

nnoremap <leader>src :source %<CR>
nnoremap <silent> <leader>syn :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>
nnoremap <leader>ind magg=G`a

" Yanks until the end of the line
nnoremap Y y$

" Kepp visual selection when indenting
vnoremap > >gv
vnoremap < <gv

" Moves text around
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==

" Keep position after visually yanking 
vnoremap y mpy`p
vnoremap Y mpY`p

" Navigates between splits more easily
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l

" Selects the first match in the spelling list
nnoremap <C-s> mp[s1z=`p
inoremap <C-s> <C-c>[s1z=`]a

iabbrev <expr> tdd strftime("%d %b %Y")

