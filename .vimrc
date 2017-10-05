set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'moll/vim-bbye'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
"Plugin 'valloric/youcompleteme'

call vundle#end()             " required
filetype plugin indent on     " required! 

" QC settings -->
  set shiftwidth=8
  set tabstop=8
  " Highlight unwanted whitespace
  "   to disable, use highlight clear ExtraWhitespace
  :highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
  " WS at end of line | space, tab | tab, space | space, text | multiple spaces not in string or comment | col 101
  :auto Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t\|\t\zs \+\|^\t*\zs \+\|^[^\*"]\{-}\zs  \+\ze\|\w\%>101v/
" QC settings <--

" direct system clipboard without + buffer
set clipboard+=unnamedplus

" general settings
colorscheme wombat256mod
let mapleader = ","
syntax on
set nu
set hlsearch
set backspace=2
set splitright
set splitbelow

" tab
"set tabstop=4 -- QC
"set shiftwidth=4 -- QC
set noexpandtab " -- QC
"set smartindent
set cindent

" listchars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" change paste
nmap <silent> cp "_ce<C-R>"<Esc>

" select block with %
noremap % v%

" Tab between windows
"noremap <tab> <c-w><c-w> # because <C-I> doesn't work

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" goodbye Ex
nnoremap Q <nop>

" buffer next prev
nmap <C-L> :bnext<CR>
nmap <C-H> :bprev<CR>
nnoremap <C-J> jzz
nnoremap <C-K> kzz
nnoremap <C-]> <C-]>zz

" toggle list
nmap <C-x> :set list!<CR>

" automaticaly open .vimrc and .gvimrc
nmap <leader>v :split $MYVIMRC<CR>

" vim-airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'molokai'

" NERDTree
" au VimEnter *  NERDTree
let g:NERDTreeWinSize = 50
let NERDTreeChDirMode = 2
let Tlist_Use_Right_Window = 1
nmap <leader>r :NERDTreeFind<cr>
nmap <leader>e :NERDTreeToggle<CR>

" ack
set grepprg=ack

" cscope
set nocst

" CCTree
"let g:CCTreeCscopeDb = "cscope.out"

" resize current buffer by +/- 5 
nnoremap <M-left> :vertical resize +5<cr>
nnoremap <M-down> :resize -5<cr>
nnoremap <M-up> :resize +5<cr>
nnoremap <M-right> :vertical resize -5<cr>

" vim-bbye
nnoremap <leader>q :Bdelete<CR>

" gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" folding
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
set foldmethod=syntax
set foldlevelstart=99

" ag-vim
let g:ag_prg="ag --vimgrep --smart-case --ignore={'tags','*.disass','*.txt','*.list','*.stats'}"
nmap <silent> <leader>f :Ag "<cword>"<CR>
nmap <silent> <leader>g :Ag "<cword>" %<CR>
"let g:ag_qhandler="vertical copen"

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" tagbar
nmap <F8> :TagbarToggle<CR>

" ycm
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_always_populate_location_list = 1
let b:ycm_largefile=1
