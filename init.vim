" nvim rc file
" Have nvim load my vim configuration
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vim/vimrc
"
"
" Starting afresh!!! Wiiii!
"
" set nocompatible  " This is set by default in neovim
"
" mapleader config
" map <Space> <Nop>
" map <Space> <Leader>
let mapleader = "\<Space>"

" Package manager minpac
packadd minpac
call minpac#init()

" have minpac manage minpac :D
" use opt so that we can load the plugin via packadd before
" any other plugin
call minpac#add('k-takata/minpac', {'type': 'opt'})
"""""""" Add other plugins here:
" Colorschemes and aesthetics
call minpac#add('KeitaNakamura/neodark.vim')
call minpac#add('rakr/vim-one')
call minpac#add('haishanh/night-owl.vim')
call minpac#add('ryanoasis/vim-devicons')
" Other colorschemes that are nice but I'm not using
" call minpac#add('tomasr/molokai')
" call minpac#add('Lokaltog/vim-distinguished')
" call minpac#add('fenetikm/falcon')
" call minpac#add('haishanh/night-owl.vim')

" Editing
call minpac#add('tpope/vim-repeat')       " Enable repeating supported plugin maps with .
call minpac#add('tpope/vim-unimpaired')   " pairs of handy bracket mappings
call minpac#add('tpope/vim-surround')     " Quoting parenthesing made simple
call minpac#add('wellle/targets.vim')     " Extend and enhances text-objects
call minpac#add('scrooloose/nerdcommenter') " Comments

" Denite - all purpose list search and actions
call minpac#add('Shougo/denite.nvim')     " denite
call minpac#add('Shougo/neomru.vim')      " most recently used
call minpac#add('neoclide/denite-git')    " git
call minpac#add('chemzqm/denite-extra')   " extra sources (session, project, commands, location, quickfix, history)

" Customize UI
call minpac#add('itchyny/lightline.vim')  " Custom Status line

" File system
call minpac#add('junegunn/fzf')            " fuzzy file search
call minpac#add('junegunn/fzf.vim')        " fuzzy file search
call minpac#add('scrooloose/nerdtree')     " File tree explorer
call minpac#add('tpope/vim-projectionist') " Semantic based navigation configurable per project
call minpac#add('mhinz/vim-grepper')       " Search files

" Support for other tools
call minpac#add('tpope/vim-fugitive')     " git wrapper
call minpac#add('tpope/vim-dispatch')     " dispatch other tools such as compilers, linters, etc
call minpac#add('radenling/vim-dispatch-neovim') 
" testing coc as a replacement for ale
" call minpac#add('w0rp/ale')             " linting, code completion, go to definition
call minpac#add('janko-m/vim-test')       " testing helpers

" Support for languages
call minpac#add('tpope/vim-ragtag')       " XML/HTML mappings
call minpac#add('godlygeek/tabular')       " required by vim-markdown
call minpac#add('plasticboy/vim-markdown') " markdown support
call minpac#add('mattn/emmet-vim') " emmet
call minpac#add('cakebaker/scss-syntax.vim') " SASS

"" JavaScript
call minpac#add('pangloss/vim-javascript') " JavaScript
call minpac#add('mxw/vim-jsx')             " JSX

"" TypeScript
" call minpac#add('leafgarland/typescript-vim') " TypeScript syntax
call minpac#add('HerringtonDarkholme/yats.vim') " TypeScript syntax

"" Elm
call minpac#add('ElmCast/elm-vim')   " Elm  support

"" Haskell
"" call minpac#add('eagletmt/neco-ghc')
"" so ghc-mod seems to be deprecated
"" a better wayto set this up would be using the LSP suppor provided by the
"" maintained haskell-ide-engine
"" see https://github.com/haskell/haskell-ide-engine/issues/331

" Autoclose tags and quotes
" Temporary disabled as it breaks abbreviations
call minpac#add('Townk/vim-autoclose')   " Autoclose parens and stuff
call minpac#add('alvan/vim-closetag')      " Autoclose html tags

" Distraction free modes
call minpac#add('junegunn/goyo.vim')      " distraction free mode
call minpac#add('junegunn/limelight.vim') " focus on what you're writing now

" Sessions and integration with other tools
call minpac#add('tpope/vim-obsession') " easy save sessions
call minpac#add('christoomey/vim-tmux-navigator') " Better navigation integration with tmux
" Tmux navigator
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split

" Autocompletion
" Deoplete provides autocompletion from many sources
" call minpac#add('Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
" let g:deoplete#enable_at_startup = 1
" call minpac#add('mhartington/nvim-typescript', {'do': './install.sh'})
" call minpac#add('Shougo/neoinclude.vim')
" call minpac#add('ujihisa/neco-look')
" call minpac#add('Shougo/echodoc.vim')
" let g:echodoc_enable_at_startup= 1
" Testing coc (conquer of completion)
call minpac#add('Shougo/neco-vim')        " completion for viml
call minpac#add('neoclide/coc-neco')      " adapter of nec to coc
call minpac#add('neoclide/coc.nvim', {'do': { -> coc#util#install()}})
" :CocInstall {coc-extensions}
" coc-tsserver - typescript completions
" coc-json     - json completions
" coc-html     - html completions
" coc-css      - css completions
" coc-word     - top 10K english words
" coc-snippets - snippets
" coc-emmet    - (do I need the other emmet plugin??)

" Snippets
" call minpac#add('Shougo/neosnippet.vim')         " snippet support 
" call minpac#add('Shougo/neosnippet-snippets')    " collection of snippets
call minpac#add('honza/vim-snippets')              " collection of snippets

" Moving around or Motions
call minpac#add('justinmk/vim-sneak')      " vim sneak. faster movement within Vim
call minpac#add('easymotion/vim-easymotion') " vim easymotion

"" Plugins config
"""" Neodark
let g:neodark#background = '#202020'

"""" Markdown
" Highlight YAML front matter
let g:vim_markdown_frontmatter = 1
"""" minpac - simpler commands
command! PackUpdate source $MYVIMRC | call minpac#update()
command! PackClean source $MYVIMRC | call minpac#clean()
command! PackStatus source $MYVIMRC | call minpac#status()
"""" ale
" Testing coc as a replacement for ale
" disable typescript. Use nvim-typescript
" only run linters I have defined
"let g:ale_linters_explicit = 1
"let g:ale_linters = {
"\'javascript': ['eslint'],
"\}

" use deoplete for completion instead of ale
" let g:ale_completion_enabled = 1
"let g:ale_sign_column_always = 1
"nmap <silent> [W <Plug>(ale_first)
"nmap <silent> [w <Plug>(ale_previous)
"nmap <silent> ]w <Plug>(ale_next)
"nmap <silent> ]W <Plug>(ale_first)

" Set this variable to 1 to fix files when you save them.
"let g:ale_fix_on_save = 1
"let g:ale_fixers = {
"\   'javascript': ['prettier'],
"\   'typescript': ['prettier'],
"\}

" Add support for virtual text
"let g:ale_virtualtext_cursor = 1

"""" vim-autoclose
" For some reason vim-autoclose breaks abbreviations unless you 
" set this:
let g:AutoCloseExpandSpace = 0 

"""" vim-snippets
" Snippets bindings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
"   imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"   \ "\<Plug>(neosnippet_expand_or_jump)"
"   \: pumvisible() ? "\<C-n>" : "\<TAB>"
"   smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"   \ "\<Plug>(neosnippet_expand_or_jump)"
"   \: "\<TAB>"

" Folder for custom snippets
"let g:neosnippet#snippets_directory=$VIMCONFIG + '/snippets'
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

"""" grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
" Search for current word
nnoremap <Leader>* :GrepperRg -cword -noprompt<CR> " Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" Open grepper prompt for different tools
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>
"""" closetags
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
"""" limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
""""" Emmet key mappings
" not really necessary in normal mode. It conflicts with C-I jump forward
" nmap <TAB> <plug>(emmet-expand-abbr)

" Color scheme
"" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
" Set colorscheme
colo one
set background=dark
" colo neodark
" colo one
" Color scheme for lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Show relative path to file in relation to
" project root folder (root of git repo).
" It uses vim-fugitive.
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

source $MYVIMCONFIG/basic-settings.vim
source $MYVIMCONFIG/navigation-mappings.vim
source $MYVIMCONFIG/windows-tabs.vim
source $MYVIMCONFIG/editing-mappings.vim
source $MYVIMCONFIG/ex-commands.vim
source $MYVIMCONFIG/autocommands.vim
source $MYVIMCONFIG/file-explorer.vim
source $MYVIMCONFIG/completion.vim
source $MYVIMCONFIG/gatsby-blogging.vim
source $MYVIMCONFIG/fzf.vim
source $MYVIMCONFIG/abbreviations.vim

" packloadall " load plugins here if required by plugins for configuration
"""" plugins that require to be loaded before configuring them go here
"" Deoplete
" source $VIMCONFIG/deoplete.vim

