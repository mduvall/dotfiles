" Bundle install plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/taglist.vim'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'juvenn/mustache.vim'
Bundle 'majutsushi/tagbar'

let g:Powerline_symbols = 'fancy'
let g:EasyMotion_leader_key = '<leader><leader>'

" No backup files
set nobackup
set nowb
set noswapfile
set scrolloff=3

"Define the font
set linespace=-1

"Deal with line no and indenting
set number

"Deal with searching through text
set showmatch
set incsearch

"Deal with file stuff
set shiftround
set nojoinspaces
set nocompatible

set tabstop=2 shiftwidth=2
au BufNewFile,BufRead,BufEnter /box/www/current/* setlocal tabstop=4 shiftwidth=4
au BufWritePost /Users/mduvall/workspace/trippinballs/*.hbs silent !grunt

"Set line jumps to 3 instead of 1
nnoremap <C-e> 3<C-e>
inoremap <C-y> 3<C-y>

"Remember undo history between buffer change
:set hidden

"Change backspacing to go to previous line
set backspace=indent,eol,start

"Change loud noise to visual bell
set mouse=a
set visualbell


"NOOB PRACTICE OK THANKS
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   :bn<cr>
noremap   <Right>  :bp<cr>

set background=dark
colorscheme molokai
set nolist

set wildignore+=*/coverage/*\,*/vendor/*'

set clipboard=unnamed

" Optimize file searching
if has("unix")
    let g:ctrlp_user_command = {
                \   'types': {
                \       1: ['.git/', 'cd %s && git ls-files']
                \   },
                \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
                \ }
endif

au BufNewFile,BufRead *.tmpl setf html

let mapleader = "\\"

map <Leader>c :TMiniBufExplorer<cr>

filetype plugin indent on
filetype indent on
syntax on

set nowrap
set ttyfast

:noremap <F1> :set hlsearch! hlsearch?<CR>
inoremap jj <Esc>
set cul

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

set foldenable
set foldmethod=indent
set foldlevel=100
set laststatus=2

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplCheckDupeBufs = 0
let g:miniBufExplMaxSize = 0

au BufWritePost /box/www/current/* silent !scp % mduvall.dev.box.net:/box/www/current/%

command Sync exec ":!cd /box/www/ && ./runsync.command"

function! RunTest()
	:silent !clear

	let t:grb_test_file = @%
	let t:cur_line = substitute(substitute(substitute(getline('.'), 'public', '', ''), 'function', '', ''), '()', '', '')
	let t:filter_suffix = ''

	if match(t:cur_line, 'test_') >= 0
		let t:filter_suffix = '--filter ' . t:cur_line
	endif

	exec ":!ssh mduvall.dev.box.net 'cd /box/www/current && phpunit " . t:filter_suffix . ' ' . t:grb_test_file  . "'"
endfunction

:noremap <F2> :call RunTest()<cr>

if has("gui_running")
	set guifont=Inconsolata:h14
	set guioptions-=T
	set guioptions+=LlRrb
	set guioptions-=LlRrb
	set linespace=1
endif

hi MBENormal guifg=#808080 guibg=fg

set wildmenu
set wildmode=longest:full,full
