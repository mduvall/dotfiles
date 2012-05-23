set nobackup
set nowb
set noswapfile

"Define the font
"
set guifont=Inconsolata:h14
set linespace=-1

"Remove toolbar and scrollbar
set guioptions-=T
set guioptions+=LlRrb
set guioptions-=LlRrb

"Moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Deal with line no and indenting
set number

"Deal with searching through text
set showmatch
set incsearch

"Deal with file stuff
filetype on
filetype plugin on
filetype indent on
set expandtab
set shiftround
set nojoinspaces
set nocompatible

"Set line jumps to 3 instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Modify the status line at bottom
set laststatus=2
set statusline=Line:\ \ %l/%L:%c\ \ \ %F%m%r%h\ %w

"Remember undo history between buffer change
:set hidden

"Remember a longer 
set history=100

"Change backspacing to go to previous line
set backspace=indent,eol,start

"Change loud noise to visual bell
set mouse=a
set visualbell

"Turn syntax highlighting on
syntax on
set syn=auto

"NOOB PRACTICE OK THANKS
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   :bn<cr>
noremap   <Right>  :bp<cr>

colorscheme Tomorrow-Night
set nolist

"let g:ctrlp_custom_ignore = '\coverage$\|\vendor$'
set wildignore+=*/coverage/*\,*/vendor/*'

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
let g:Powerline_symbols = 'fancy'

set ttymouse=xterm2
set clipboard+=unnamed

let g:ctrlp_max_files = 10000

" Optimize file searching
if has("unix")
    let g:ctrlp_user_command = {
                \   'types': {
                \       1: ['.git/', 'cd %s && git ls-files']
                \   },
                \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
                \ }
endif
