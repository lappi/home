" NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/oleg/.nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/oleg/.nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'moll/vim-bbye'
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'fatih/vim-go'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'roxma/SimpleAutoComplPop'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" End NeoBundle Scripts-------------------------

" direct system clipboard without + buffer
set clipboard+=unnamedplus

" general settings
colorscheme wombat256mod
let mapleader = ","
syntax on
set nu
set hlsearch
set backspace=2
set ts=4 sw=4
set splitright
set splitbelow

" tab
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" change paste
nmap <silent> cp "_ce<C-R>"<Esc>

" Tab between windows
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" buffer next prev
nmap <C-L> :bnext<CR>
nmap <C-H> :bprev<CR>

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

" resize current buffer by +/- 5
nnoremap <M-left> :vertical resize +5<cr>
nnoremap <M-down> :resize -5<cr>
nnoremap <M-up> :resize +5<cr>
nnoremap <M-right> :vertical resize -5<cr>

" vim-bbye
nnoremap <leader>q :Bdelete<CR>

" folding
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
set foldmethod=syntax
set foldlevelstart=99

" ag-vim
nmap <silent> <leader>f :Ag "<cword>" <CR>

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" change pwd
cd /home/oleg/work

" vim-go
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)

"set shell=/bin/sh
"let g:go_bin_path = "/home/oleg/work/my/go/bin"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" SimpleAutoComplPop
" 1. variables are all defined in current scope, use keyword from current
" buffer for completion `<C-x><C-n>`
" 2. When the '.' is pressed, use smarter omnicomplete `<C-x><C-o>`, this
" works well with the vim-go plugin
autocmd FileType go call sacp#enableForThisBuffer({ "matches": [
            \ { '=~': '\v[a-zA-Z]{4}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
            \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-o>", "ignoreCompletionMode":1} ,
            \ ]
            \ })
