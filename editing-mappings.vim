" Custom Mode changing mappings
" Remap <ESC> so it and it forces me to learn how to do it properly
" 2019-01 This stopped working for some reason
" inoremap <ESC> <NOP>
" Type jk to leave insert mode
inoremap jk <ESC>
inoremap jj <ESC>


" Since I remapped J and I still want to join stuff
nnoremap <Leader>j J
vnoremap <Leader>j J
" Test M as in Merge
nnoremap M J
vnoremap M J

" Keep s available
" Removing temporarily to test <leader>s as cmdp
" nnoremap <Leader>sl s
