" Make easy editing and sourcing vimrc
command! RefreshConfig source $MYVIMRC <bar> echo "Refreshed vimrc!"
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :RefreshConfig<cr>
" For some reason refreshing config screws with the tmux plugin. (TODO: Investigate!)

" Custom Mode changing mappings
" Remap <ESC> so it and it forces me to learn how to do it properly
inoremap <ESC> <NOP>
" Type jk to leave insert mode
inoremap jk <ESC>


" Since I remapped J and I still want to join stuff
nnoremap <Leader>j J
