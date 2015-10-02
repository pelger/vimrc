" .vimrc for Mac 
" P.Elger
"
" :norm @a to replay a macro on a visual selection

set cf
set clipboard+=unnamed
set history=1024
set autowrite
set timeoutlen=250
set showmatch
set mat=5
set noeb
set vb
set laststatus=2
set backup
set backupdir=~/tmp/vimback
set directory=~/tmp
set backspace=2
set noerrorbells
set esckeys
set hlsearch
set ignorecase
set incsearch
set modeline
set modelines=1
set ruler
set showcmd
set showmode
set wrapmargin=2
set nowritebackup
set shiftwidth=2
set tabstop=2
set softtabstop=0
set expandtab
set nowrap
set autoindent
set nosmartindent
set nocindent
set textwidth=5000
autocm BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif
:syn on
syntax enable
set scrolloff=3
set hidden
runtime macros/matchit.vim
set wildmode=list:longest
set lcs=tab:>-,trail:-,eol:<
nmap <silent> ,s :set nolist!<CR>

"-----------------------------------------------------------
" vundle plugins

set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'c9s/bufexplorer'
Plugin 'kien/ctrlp.vim'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'VimExplorer'

" for viki
Plugin 'vim-scripts/multvals.vim'
Plugin 'vim-scripts/genutils'
Plugin 'tomtom/tlib_vim'
Plugin 'tomtom/viki_vim'
Plugin 'DrawIt'
Plugin 'digitaltoad/vim-jade'
Plugin 'leafgarland/typescript-vim'
Plugin 'mivok/vimtodo'

Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on


if has("gui_running") 
  set background=dark
  let g:solarized_contrast="low"
  syntax enable
  set background=dark
  colorscheme solarized
endif


"-----------------------------------------------------------
" plugins config

let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons=0
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_loc_list=0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{SyntasticStatuslineFlag()}\ %{fugitive#statusline()}
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_quiet_messages = {}

let g:miniBufExplSplitBelow=0

function UseEsLint()
  let g:syntastic_javascript_checkers=['eslint']
endfunction

function UseJsHint()
  let g:syntastic_javascript_checkers=['jshint']
endfunction


:let mapleader = ","
map ,e :NERDTree<cr>
map ,b :TMiniBufExplorer<cr>
map ,x :call UseEsLint()<cr>
map ,j :call UseJsHint()<cr>

