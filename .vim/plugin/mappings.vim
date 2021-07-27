let mapleader = " " 

nnoremap ]q <Cmd>cnext<CR>
nnoremap [q <Cmd>cprevious<CR>

nnoremap ]a <Cmd>next<CR>
nnoremap [a <Cmd>previous<CR>

nnoremap <leader>cs :mks! .vim-session<CR>
nnoremap <leader>ss <Cmd>source .vim-session<CR>

nnoremap <leader>- <Cmd>silent edit %:p:h<CR><C-L>
nnoremap <leader>~ <Cmd>silent edit `pwd`<CR><C-L>

nnoremap <leader>qo <Cmd>copen<CR>
nnoremap <leader>qc <Cmd>cclose<CR>

nnoremap <leader>nu <Cmd>setl nu! nornu<CR>
nnoremap <leader>rnu <Cmd>setl rnu! nonu<CR>

nnoremap <leader>st <Cmd>setl list!<CR>
nnoremap <leader>sp <Cmd>setl spell!<CR>

nnoremap <leader>cd <Cmd>lcd %:p:h<CR>
nnoremap <leader>cb <Cmd>lcd -<CR>

nnoremap <leader>rg :argdo! %s/<C-R><C-W>//gce<left><left><left><left>
nnoremap <leader>rl :%s/<C-R><C-W>//gce<left><left><left><left>

nnoremap <leader>src :source %<CR>
nnoremap <leader>syn <Cmd>call utils#SyntaxGroup()<CR>

nnoremap <leader>tn <Cmd>tabnew<CR>
nnoremap <leader>tc <Cmd>tabclose<CR>

nnoremap <leader>mk <Cmd>silent make <Bar> silent redraw!<CR>
nnoremap <leader>op <Cmd>!open .<CR>

nnoremap <leader>tt <Cmd>edit TODO<CR>
nnoremap <leader>vt <Cmd>vs TODO<CR>

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

nnoremap <leader>ind magg=G`a
inoremap <C-L> <C-C>[s1z=`]a

iabbrev <expr> tdd strftime("%d %b %Y")
