
set nobackup
set nowb
set noswapfile

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
set tabstop=4 shiftwidth=4
set autoread

"Set line jumps to 3 instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Modify the status line at bottom
set laststatus=2
set statusline=Line:\ \ %l/%L:%c\ \ \ %F%m%r%h\ %w

"Remember undo history between buffer change
:set hidden

"Remember a longer 
set history=1000

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

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
endfunc

map <F6> :call InterpretPython()<CR>
func! InterpretPython()
    exec "w"
    exec "!python %"
endfunc


