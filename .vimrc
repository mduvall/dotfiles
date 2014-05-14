" Vundle ceremony {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }}}

" Plugins {{{
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'bling/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'groenewege/vim-less'
Bundle 'fatih/vim-go'
" }}}

" Settings {{{
set runtimepath+=$GOROOT/misc/vim " Make Go happy
set nocompatible               " It's 2014
set nobackup                   " Don't make a backup file
set noswapfile                 " Don't create a swapfile for buffers
set scrolloff=3                " Always keep 3 lines at the end during C-e/C-y
set showmatch                  " Show paren matching
set incsearch                  " Show results while typing
set hlsearch                   " Highlight matches, F1 this off
set expandtab                  " Splat tabs into their spaces
set tabstop=4                  " A tab is 4 spaces
set softtabstop=4              " A soft tab is also 4 spaces
set shiftwidth=4               " A > over is 4 spaces
set backspace=indent,eol,start " Because we want to backspace like humans
set mouse=a                    " Enable GUI mouse usage on xterm
set visualbell                 " Please, bother me with notifications
set wildignore+=*/coverage/*\,*/vendor/*',*/node_modules/** " Always ignore these directories
set clipboard=unnamed          " Use clipboard register for all the things
set nowrap                     " Don't wrap text
set ttyfast                    " Make copy-pasting things not freeze vim
set wildmenu                   " Nifty tab auto-complete menu
set wildmode=longest:full,full " Some auto-complete settings
set colorcolumn=80             " In case the program is on an IBM punch card
set background=dark            " Background setting for color themes that use this
set hidden                     " Push to bg, don't need to save
set laststatus=2               " Show the status bar
set autoread                   " Read in changed files on disk
set number                     " Show me the line numbers please
set shell=/bin/bash            " Use bash for vim always since fish is in term
" }}}

" File type/syntax settings {{{
colorscheme molokai

" Let files be indented according to their file type
filetype indent on
" Turn on syntax highlighting so vim looks cool
syntax on
" }}}

" Key mappings {{{
" Enable scrolling to go up and down 3 lines at a time
nnoremap <C-e> 3<C-e>
inoremap <C-y> 3<C-y>

" Deletes the rest of the line
nnoremap D d$

" Traverse buffers with arrows
noremap   <Left>   :bp<cr>
noremap   <Right>  :bn<cr>

" Turn search highlighting off and on
noremap <F1> :set hlsearch! hlsearch?<CR>

" Alternate way to jump to normal mode
inoremap jj <Esc>

" Easier split pane navigation
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Because we always forget to sudo
cmap w!! %!sudo tee > /dev/null %

" cd to wherever we are
nmap <leader>cd :cd %:h<CR>

" I wish vim can just detect what's going on with tabs and spaces in a file
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Trigger directory tree
nmap <leader>d :NERDTreeToggle<CR>

" Show the buffers open and clear cache hotkeys
nmap <leader>r :CtrlPBuffer<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" Hit * and stay on highlighted word
nnoremap * *<c-o>

" Sane controls for search navigation
nnoremap n nzzzv
nnoremap N Nzzzv

" Jump to end and beginning of line
noremap H ^
noremap L $

nmap <leader>g :!go run %<CR>

" }}}

" Plugin settings {{{
let mapleader = ","
let g:EasyMotion_leader_key = '<leader><leader>'
let g:airline_powerline_fonts = 1
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path=0
" }}}

" GUI settings {{{
if has("gui_running")
    set guifont=Inconsolata\ for\ Powerline:h16
    set guioptions-=T
    set guioptions+=LlRrb
    set guioptions-=LlRrb
    set linespace=1
endif
" }}}

" File specific hooks/settings {{{
au BufWritePre *.go Fmt
au BufWinEnter * set foldlevel=999999
au BufWritePre * :%s/\s\+$//e
au FocusLost * :silent! wall
au VimResized * :wincmd =
au Filetype markdown setlocal wrap
" }}}

" vim:foldmethod=marker:foldlevel=0

