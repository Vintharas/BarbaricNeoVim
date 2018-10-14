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

" Package manager minpac
packadd minpac
call minpac#init()

" have minpac manage minpac :D
" use opt so that we can load the plugin via packadd before
" any other plugin
call minpac#add('k-takata/minpac', {'type': 'opt'})
"""""""" Add other plugins here:
" Colorschemes
call minpac#add('KeitaNakamura/neodark.vim')
call minpac#add('tomasr/molokai')
call minpac#add('Lokaltog/vim-distinguished')
call minpac#add('fenetikm/falcon')
call minpac#add('haishanh/night-owl.vim')

" Editing
call minpac#add('tpope/vim-repeat')       " Enable repeating supported plugin maps with .
call minpac#add('tpope/vim-unimpaired')   " pairs of handy bracket mappings
call minpac#add('tpope/vim-surround')     " Quoting parenthesing made simple

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
call minpac#add('w0rp/ale')               " linting, code completion, go to definition
call minpac#add('janko-m/vim-test')       " testing helpers

" Support for languages
call minpac#add('pangloss/vim-javascript') " JavaScript
call minpac#add('mxw/vim-jsx')             " JSX
call minpac#add('tpope/vim-ragtag')       " XML/HTML mappings
call minpac#add('godlygeek/tabular')       " required by vim-markdown
call minpac#add('plasticboy/vim-markdown') " markdown support

"" TypeScript
call minpac#add('leafgarland/typescript-vim') " TypeScript
call minpac#add('Shougo/vimproc.vim', {'do': 'make'}) " needed for tsuquyomi
call minpac#add('Quramy/tsuquyomi')          " TypeScript language services and such
" This doesn't seem to work very well with neovim. I need to investigate further

"" Elm
call minpac#add('ElmCast/elm-vim')   " Elm  support

" Autoclose tags and quotes
call minpac#add('Townk/vim-autoclose')    " Autoclose parens and stuff
call minpac#add('alvan/vim-closetag')      " Authoclose html tags

" Distraction free modes
call minpac#add('junegunn/goyo.vim')      " distraction free mode
call minpac#add('junegunn/limelight.vim') " focus on what you're writing now


"" Plugins config
"""" Markdown
" Highlight YAML front matter
let g:vim_markdown_frontmatter = 1
"""" FZF - bind file fuzzy search to C-p
nnoremap <C-p> :<C-u>FZF<CR> 
"""" minpac - simpler commands
command! PackUpdate source $MYVIMRC | call minpac#update()
command! PackClean source $MYVIMRC | call minpac#clean()
command! PackStatus source $MYVIMRC | call minpac#status()
"""" ale
let g:ale_linters = {
\'javascript': ['eslint'],
\'typescript': ['tsserver'],
\}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_first)

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['prettier'],
\}
"""" tsuquyomi
let g:tsuquyomi_completion_detail = 1
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

" Load the plugins right now. (optional)
"packloadall

" Color scheme
"" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Set colorscheme
colorscheme neodark
" Color scheme for lightline
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'

"" Basic commands
command! RefreshConfig source $MYVIMRC

"" Basic vim setup
" mapleader config
noremap <Space> <Nop>
let mapleader = "\<Space>"

" Filetypes
filetype on         " enable file type detection
filetype plugin on  " enable loading plugins for ft
filetype indent on  " enable indent per ft
syntax enable    " enable syntax highlighting

set clipboard+=unnamedplus " use system clipboard
set showcmd      " display incomplete commands
set showmode     " display the mode you're in
set backspace=indent,eol,start "intuitive backspacing"
set hidden       " Handle multiple buffers better
set wildmenu     " enhanced command line completion
set wildmode=list:longest " complete files like a shell

""" Search
set ignorecase   " case-insensitive search
set smartcase    " but case-sensitive if expression contains a capital letter
set relativenumber "show relative line number
set ruler        " show cursor position
set incsearch    " highlight matches as you type
set hlsearch     " highlight matches
" clear highlights
nnoremap <leader><space> :noh<CR> 

""" Regex
set gdefault     " use global option in regex by default

set wrap         " turn on line wrapping
set scrolloff=3  " show 3 lines of context around cursor
set display+=lastline "Display as much as possible of a window's last line
set title        " show terminal title
set visualbell   " no beeping
set list         " show invisible characters

"" Global tabs/spaces
set tabstop=2    " global tab width
set shiftwidth=2
set expandtab    " use spaces instead of tabs
set laststatus=2 " Always show a status line

set nobackup " no backups
set nowritebackup " No backups
set noswapfile " No swap files
set autoread " Automatically re-read files changed outside of vim
set nofoldenable " Disable folding

" Custom Mode changing mappings
inoremap jj <ESC> " Type j twice to leave insert mode

" Navigation: Custom Motions/Movements
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

"" Moving between buffers
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

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

" Custom Text editing
" Since I remapped J and I still want to join stuff
nnoremap <Leader>j J

" Moving to matching bracket
nnoremap <tab> % 
vnoremap <tab> %

