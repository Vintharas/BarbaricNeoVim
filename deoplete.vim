" General configuration
let g:deoplete#auto_complete_delay = 0
" let g:deoplete#auto_refresh_delay = 10
set cmdheight=2 " necessary to show echodoc information
set completeopt+=menuone,noinsert,noselect
set completeopt-=preview

" Configurations per source
" For file source: file source completes the files from the buffer path instead of the current directory.
let g:deoplete#file#enable_buffer_path=1
" To type unicode characters <C-V>u{code}
call deoplete#custom#source('file', 'mark', '')
call deoplete#custom#source('buffer', 'mark', '')
call deoplete#custom#source('omni', 'mark', '﫜')
call deoplete#custom#source('neosnippet', 'mark', '')
call deoplete#custom#source('vim', 'mark', '')
call deoplete#custom#source('typescript', 'mark', '')
call deoplete#custom#source('javascript', 'mark', '')

let g:deoplete#ignore_sources = {
 \ 'typescript': ['look', 'member', 'buffer', 'around'],
 \ '_': ['look']}

" Disable deoplete in some filetypes
 autocmd FileType markdown
 \ call deoplete#custom#buffer_option('auto_complete', v:false)

" Key mappings for deoplete
" inoremap <silent><expr> <TAB>
"      \ deoplete#mappings#close_popup()
" Select next item with <TAB>
" Or expand emmet if popup menu is not visible
imap <expr> <TAB> pumvisible() ? '<C-N>' : '<C-Y>,'
" Select previous item
inoremap <S-TAB> <C-P>

" Trigger manual complete using CTRL and SPACE
inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
