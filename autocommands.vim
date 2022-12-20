"This is a hack. I should enable this in a project
"specific vimrc file instead of fucking around here
augroup leanpub_txt
autocmd!
autocmd BufWritePre *.txt setfiletype markdown
" autocmd BufEnter,BufRead *.txt setfiletype markdown
" disable on BufEnter and BufRead because then I get all vim
" text files formatted as markdown. Wop
augroup END

augroup my_markdown
autocmd!
autocmd FileType markdown nmap <leader>d $F-a<space>[*]<ESC>
augroup END

" For some reason the ftdetect of vim-svelte
" inside polyglot is not running this autocommand
" so I have duplicated it here
augroup svelte
au!
au BufRead,BufNewFile *.svelte setfiletype svelte
augroup END

" Treat all json files as jsonc so that comments are allowed and don't result
" in diagnostic errors
augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

augroup goAutocmd
  " Don't visualize invisible characters
  " The gofmt is going to fix everything anythow
  autocmd! FileType go set nolist
augroup END
