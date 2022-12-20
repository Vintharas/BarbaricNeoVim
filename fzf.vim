" FZF fuzzy file search

"""" FZF - bind file fuzzy search to C-p
nnoremap <C-p> :<C-u>FZF<CR> 
nnoremap <leader>s :<C-u>FZF<CR> 
nnoremap <leader>b :<C-u>Buffers<CR> 

" Required:
" - width [float range [0 ~ 1]]
" - height [float range [0 ~ 1]]
"
" Optional:
" - xoffset [float default 0.0 range [0 ~ 1]]
" - yoffset [float default 0.0 range [0 ~ 1]]
" - highlight [string default 'Comment']: Highlight group for border
" - border [string default 'rounded']: Border style ('rounded' | 'sharp' | 'horizontal')
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
