" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Some useful plugins here
Plugin 'flazz/vim-colorschemes'            " All colorscheme
Plugin 'ctrlp.vim'                         " File searcher <c-p>
Plugin 'EasyMotion'                        " Jumping over places <leader><leader>w
Plugin 'The-NERD-tree'                     " File browser <leader>d
Plugin 'The-NERD-Commenter'                " Commenter `<leader>c<space>`
Plugin 'fugitive.vim'                      " Git wrapper
Plugin 'airblade/vim-gitgutter'            " Git changes sign
Plugin 'SuperTab'                          " Auto complete <tab>
Plugin 'delimitMate.vim'                   " Auto add matching [({''})]
Plugin 'bling/vim-airline'                 " Statusline
Plugin 'vim-airline/vim-airline-themes'    " Themes for airline plugin
Plugin 'mattn/emmet-vim'                   " Emmet for vim `<c-y>,`
Plugin 'MatchTag'                          " Highlight matching html tag
Plugin 'BufOnly.vim'                       " Close all buffer but this one. :Bufonly
Plugin 'NrrwRgn'                           " Separate selected text and edit it to new window :NR
Plugin 'surround.vim'                      " Surrounder `cs*`
Plugin 'vim-utils/vim-man'                 " View other program's manual page in vim :Man
Plugin 'Tabular'                           " Aligning tool :Tabular /{pattern}
Plugin 'textutil.vim'                      " Open rtf, doc, rtfd, wordml as plain text (Mac only)
Plugin 'Tagbar'                            " List tags in sidebar

if executable('ack') || executable('ack-grep')
    
    Plugin 'ack.vim'           " Better than grep, they said http://beyondgrep.com
    Plugin 'NERD_Tree-and-ack' " Find in folder, from nerdtree
endif

if executable('ag')
    " Seriously, use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    Plugin 'rking/ag.vim'
endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Plugin configurations

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" Git Gutter
let g:gitgutter_realtime = 0 " disable realtime update, in hope vim doesn't lag
let g:gitgutter_eager = 0
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>G :GitGutterLineHighlightsToggle<CR>
" hunk stage = <leader>hs
" hunk revert stage (unstage) = <leader>hr

" Vim Airline
set laststatus=2 " always show statusline
let g:airline#extensions#tabline#enabled =1 " enable tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show only the file name
" Use simple square shaped statusline rather than 'fancy' powerline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" Use this instead if you want to use powerline
"let g:airline_powerline_fonts = 1 

" NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>D :NERDTreeFind<CR>

" Emmet-Vim, trigger pake ini <c-y>,

" Surround cheatsheet
" cs"'
" cs'<q>
" cst"
" ds"
" S<p class="something">

" CtrlP
" keep cache when reopen CtrlP, to refresh use <F5>
let g:ctrlp_clear_cache_on_exit = 0

" General Configurations

set encoding=utf-8
set fileencoding=utf-8
set smartcase
set noswapfile
set hidden

"Colors
syntax enable " enable syntax processing
set background=dark
set t_Co=256 " set terminal color to use 256
silent! colorscheme Tomorrow-Night " Chose this color if it's exists, surpress the error if it isn't
" Enable transparent background
hi Normal ctermbg=NONE
" Provide shortcut for solarized colorscheme, because why not?
nnoremap <leader><leader>bg :silent! colorscheme solarized<CR>

"Space & Tabs
set tabstop=4 " tab width
set softtabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set backspace=indent,eol,start " backspace hapus tab, end of line, start line

"UI Config
set number " show line numbers
set norelativenumber " default use no relative numbering.
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set formatoptions-=cro " disable auto comment
set nowrap " nowrap line
set diffopt +=vertical " open diffs in vertical split.
set listchars=tab:▸\ ,eol:¬
" toggle list
nnoremap <leader>l :set list!<CR>
" toggle relative numbering
nnoremap <C-n> :set relativenumber!<CR>
" toggle highlight current line
nnoremap <leader>hx :set cursorline!<CR>
" toggle highlight current column
nnoremap <leader>hy :set cursorcolumn!<CR>
"filetype indent on " load filetype-specific indent files
"set lazyredraw " redraw only when we need to.
"set showmatch " highlight matching [{()}]


"Searching
set ignorecase " be case insensitive
set gdefault " always turn on global regex
set incsearch " search as characters are entered
set hlsearch " highlight matches
" set visually selected text as search param
vnoremap // y/<C-R>"<CR> 

if executable('ack')
  " Use Ack over Grep
  set grepprg=ack\ --nogroup\ --nocolor
elseif executable('ack-grep')
  set grepprg=ack-grep\ --nogroup\ --nocolor
endif

if executable('ag')
  " Use Ag over Grep or Ack
  set grepprg=ag\ --nogroup\ --nocolor
endif

"Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
" space open/close folds
nnoremap <space> za 

"Movement and Scrolling
set scrolloff=1 " Show n lines after / before scrolling
set scrolloff=1 " Show 1 lines after / before scrolling
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nmap <S-j> <C-d>
nmap <S-k> <C-u>

" Clipboard
if has('clipboard')
    set mouse=a " enable mouse

    " Use ctrl-c to copy selected text to clipboard
    vmap <C-c> "+y
endif
set pastetoggle=<leader>p

" Buffers
set autoread " auto reload if a file modified outside vim

" General Shortcut & Mapping

nnoremap ; :
vnoremap ; :

" Edit vimrc
nnoremap <leader>v :e ~/.vimrc<CR>

" reload vimrc
nnoremap <leader><leader>v :source ~/.vimrc<CR>

" Easier window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Close current window
nnoremap <leader>w <C-w>c

" Open previously open buffer
nnoremap <leader>b :b#<CR>

" Force close all buffers
nnoremap <leader>bd :bufdo bd!<CR>

" Some mapping from tpope's unimpaired
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Command line
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" Specific setting for gui vim
if has('gui_running')
    silent! colorscheme gruvbox
    " Font for macvim/gvim
    set guifont=Droid\ Sans\ Mono\ for\ Powerline

    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=L "remove left scroll bar
end

" Macvim
if has('gui_macvim')
    set transparency=10
endif

" Performance issue improvement
" one day I run into a large file and my vim somehow went lagging,
" so this is what I found on the google
autocmd BufEnter * :syn sync maxlines=500
syntax sync minlines=256
syntax sync maxlines=256
set synmaxcol=800
set nocursorcolumn
set nocursorline

" Load local config if exists
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
