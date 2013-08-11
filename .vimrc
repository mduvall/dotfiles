" Bundle install plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-powerline'

set runtimepath+=$GOROOT/misc/vim

set nobackup
set nowb
set noswapfile
set scrolloff=3
set linespace=-1
set showmatch
set incsearch
set hlsearch
set shiftround
set nojoinspaces
set nocompatible
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set mouse=a
set visualbell
set wildignore+=*/coverage/*\,*/vendor/*'
set clipboard=unnamed
set nowrap
set ttyfast
set wildmenu
set wildmode=longest:full,full
set colorcolumn=80
set list
set listchars=tab:›\ ,eol:¬,trail:⋅
set background=dark
set cul
set hidden
set laststatus=2

filetype plugin indent on
filetype indent on
syntax on

colorscheme molokai

let mapleader = "\\"
map <Leader>c :TMiniBufExplorer<cr>

nnoremap <C-e> 3<C-e>
inoremap <C-y> 3<C-y>
noremap   <Left>   :bp<cr>
noremap   <Right>  :bn<cr>
noremap <F1> :set hlsearch! hlsearch?<CR>
inoremap jj <Esc>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
cmap w!! %!sudo tee > /dev/null %
nmap <leader>cd :cd %:h<CR>
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>


let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplCheckDupeBufs = 0
let g:miniBufExplMaxSize = 0

let g:Powerline_symbols = 'fancy'
let g:EasyMotion_leader_key = '<leader><leader>'

if has("gui_running")
    set guifont=Inconsolata:h14
    set guioptions-=T
    set guioptions+=LlRrb
    set guioptions-=LlRrb
    set linespace=1
endif

autocmd BufWritePre *.go Fmt
autocmd BufWinEnter * set foldlevel=999999
autocmd BufWritePre * :%s/\s\+$//e
