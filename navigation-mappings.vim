"" Wrapped lines
" Make sure that movements work as expected in wrapped lines
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> 0 g0
noremap <silent> ^ g^
noremap <silent> $ g$
noremap <silent> gj j
noremap <silent> gk k
noremap <silent> g0 0
noremap <silent> g^ ^
noremap <silent> g$ $

" Remap other keys so we keep functionality available

"" Moving around faster
nmap J 5j
nmap K 5k
vmap J 5j
vmap K 5k
nmap H ^
nmap L $
vmap H ^
vmap L $

"" Re-enabling keyword search in nvim
nnoremap <Leader>k K
vnoremap <Leader>k K

"" Moving between buffers
" These ones would be even nicer but the integration
" with tmux wouldn't work as well. I'd need to remember
" two sets of mappings. Keeping them if I consider to
" use neovim terminal instead of tmux
" nmap gh <C-w>h
" nmap gj <C-w>j
" nmap gk <C-w>k
" nmap gl <C-w>l

" Moving to matching bracket
" nnoremap <tab> % 
" vnoremap <tab> %

