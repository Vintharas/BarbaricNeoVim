" Ex commands mappings
" Make easy editing and sourcing vimrc
command! RefreshConfig source $MYVIMRC <bar> echo "Refreshed vimrc!"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>es :RefreshConfig<cr>
nnoremap <leader>el :vsplit $MYLUAVIMRC<cr>
" For some reason refreshing config screws with the tmux plugin. (TODO: Investigate!)

" Remapping ; to : so I don't need to type SHIFT
" 01-2019: This is very nice but I miss ; to move to next match and my brain
" expects ; to be : when I'm in insert mode. So it's very weird
" 03-2019: going to temporary disable it so I can try vim-sneak
" noremap ; :
" noremap <Leader>; ;
" for symmetry I also remap the other search operator
" noremap <Leader>, ,

" Quick ex-commands
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
" noremap <Leader>wq :wq<CR>

" Good command line history navigation
" C-n and C-p by default don't filter
" by mapping them to the arrow keys they do
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>


" clear highlights
nnoremap <leader>/ :noh<CR> 
nnoremap <leader>// :noh<CR>

" vecka.nu
" echoes week number (%W is 0 based)
command! VeckaNu echo strftime('%W')

" Blog commands
command! -nargs=* BlogNewNotes execute "!mkdir src/pages/notes/".LowercaseAndReplaceSpacesWithDashes(<q-args>) | execute "e src/pages/notes/".LowercaseAndReplaceSpacesWithDashes(<q-args>)."/index.md"
command! -nargs=* Wat execute "echo " string(<q-args>)

function LowercaseAndReplaceSpacesWithDashes(text)
  return tolower(substitute(a:text, ' ', '-', 'g'))
endfunction

