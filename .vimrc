"sdlkfjsldkfjdslkfj
"Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Setup: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'


" Add Plugins here..
Plugin 'flazz/vim-colorschemes' " all colorscheme
Plugin 'Solarized' " you know it
Plugin 'ctrlp.vim' " similar to ctrl-p in sublime text
Plugin 'EasyMotion' " easy motion, use: \\w
Plugin 'mileszs/ack.vim' " Ack
Plugin 'The-NERD-tree' " file browser
Plugin 'The-NERD-Commenter' " commenter
Plugin 'NERD_Tree-and-ack' " nerdtree act, search pattern (pake quote)
Plugin 'fugitive.vim' " git wrapper
Plugin 'AutoClose' " auto add matching [({''})]
Plugin 'SuperTab' " auto complete
Plugin 'bling/vim-airline' " statusline
Plugin 'mattn/emmet-vim'
Plugin 'MatchTag' " highlight matching html tag
Plugin 'jdkanani/vim-material-theme' " Material theme.

"Plugin 'airblade/vim-gitgutter' "adds +, -, or ~ next to the line numbers,
"enek sing ngomong jarene iki marai lemot, di komen ae.

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

" Plugin Custom Config

" Vim Airline
set laststatus=2 " always show statusline
let g:airline#extensions#tabline#enabled =1 " enable tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show just the file name
let g:airline_powerline_fonts = 1

" unicode symbols, pakai ini kalo belum punya patched font nya.
"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.space = "\ua0"
"let g:airline_symbols.whitespace = 'Ξ'

"NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>D :NERDTreeFind<CR>

"Emmet-Vim, trigger= '<c-y>,'


"CtrlP
let g:ctrlp_clear_cache_on_exit = 0

"^ START
"NOTE:
"use "+y in normal mode to copy
"use "+p in normal mode to copy

"Etc
set encoding=utf-8
set fileencoding=utf-8
set smartcase
set noswapfile
set hidden

"Colors
syntax enable " enable syntax processing
set t_Co=256
set background=dark
"let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized
colorscheme obsidian

"Space & Tabs
set tabstop=4 " tab width
set softtabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set backspace=indent,eol,start " backspace hapus tab, end of line, start line

"UI Config
set number " show line numbers
set showcmd " show command in bottom bar
"set cursorline " highlight current line
"filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
"set lazyredraw " redraw only when we need to.
"set showmatch " highlight matching [{()}]
set formatoptions-=cro " disable auto comment
set nowrap " nowrap line


"Searching
set ignorecase " be case insensitive
set gdefault " always turn on global regex
set incsearch " search as characters are entered
set hlsearch " highlight matches
" set selected text as search param, use //
vnoremap // y/<C-R>"<CR> 

"Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
" space open/close folds
nnoremap <space> za 
set foldmethod=indent " fold based on indent level

"Movement and Scrolling
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nmap <S-j> <C-d>
nmap <S-k> <C-u>
set scrolloff=1 " Show 1 lines after / before scrolling

"My Remap

" Edit vimrc
nnoremap <leader>v :e ~/.vimrc<CR>

" Save vimrc
nnoremap <leader><leader>v :w<CR>:source ~/.vimrc<CR>

" Paste toggle
set pastetoggle=<leader>p

" Permudah navigasi antar window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nnoremap <leader>w <C-w>c
nnoremap <leader>W <C-w>o

" buffer
nnoremap <leader>b :bn<CR>
nnoremap <leader>B :bp<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>N :bd<CR>

" Performance issue improvement, hasil browsing, not sure how it works though.
autocmd BufEnter * :syn sync maxlines=500
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800
set nocursorcolumn
set nocursorline
syntax sync minlines=256

" Some setting for gvim
if has('gui_running')
    colorscheme material-theme
    " Font for macvim/gvim
    set guifont=Droid\ Sans\ Mono\ for\ Powerline

    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=L "remove left scroll bar
end
