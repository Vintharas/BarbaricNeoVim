"This is a hack. I should enable this in a project
"specific vimrc file instead of fucking around here
augroup leanpub_txt
autocmd!
autocmd BufWritePre *.txt setfiletype markdown
" autocmd BufEnter,BufRead *.txt setfiletype markdown
" disable on BufEnter and BufRead because then I get all vim
" text files formatted as markdown. Wop
augroup END
