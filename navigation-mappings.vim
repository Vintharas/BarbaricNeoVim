"" Wrapped lines
" Make sure that movements work as expected in wrapped lines
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

"" Moving around faster
nmap J 5j
nmap K 5k
vmap J 5j
vmap K 5k

"" Moving between buffers

"" These ones would be even nicer but the integration
"" with tmux wouldn't work as well. I'd need to remember
"" two sets of mappings. Keeping them if I consider to
"" use neovim terminal instead of tmux
" nmap gh <C-w>h
" nmap gj <C-w>j
" nmap gk <C-w>k
" nmap gl <C-w>l

" next tab
nmap <C-l> gt
" previous tab
nmap <C-h> gT
"" More tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Moving to matching bracket
nnoremap <tab> % 
vnoremap <tab> %

