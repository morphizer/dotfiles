set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle stuff
Bundle 'gmarik/vundle'

Bundle 'godlygeek/tabular'
Bundle 'rodjek/vim-puppet'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'jakar/vim-json'
Bundle 'scrooloose/nerdtree'

syntax on

filetype plugin indent on

set t_Co=256
colorscheme Tomorrow-Night

" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:>.

set backspace=2

syntax on

" Shortcut to sudo save a file
cmap w!! %!sudo tee > /dev/null %

" Searching help
set ignorecase smartcase
set incsearch
set hlsearch

" show line numbers
set number
set nuw=5

" Keep more text when scrolling off the end of a buffer
set scrolloff=3

" color in 81st column as a reminder
if exists("+colorcolumn")
    set colorcolumn=+1
endif

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Show status line and cursor position
set laststatus=2
set ruler

" Undo settings
if has ("persistent_undo")
    set undofile
    let &undodir="~/.vim/undo"
    if !isdirectory(&undodir)
        exec "silent !mkdir -p " . &undodir
    endif
    set undoreload=10000
endif 
set undolevels=1000
        
" Toggle paste mode with F2
map <F2> :set invpaste<cr>
set pastetoggle=<F11>

" Mouse support
set mouse=a

" Window splitting
set splitbelow
set splitright

" Fold mappings
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Quit NERDTree and open file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd VimEnter * NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowLineNumbers=0
