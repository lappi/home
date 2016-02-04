set nocompatible               " be iMproved
filetype off                   " required!

" vundle
call vundle#rc()
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Bundle 'steffanc/cscopemaps.vim'
Plugin 'vcscommand.vim'
Plugin 'Conque-Shell'
Plugin 'a.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'bling/vim-airline'
Plugin 'moll/vim-bbye'
Plugin 'tpope/vim-fugitive'

filetype plugin indent on     " required! 

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

" select block with %
noremap % v%

" Tab between windows
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" buffer next prev delete
nmap <C-L> :bnext<CR>
nmap <C-H> :bprev<CR>

" automaticaly open .vimrc and .gvimrc
nmap <leader>v :split $MYVIMRC<CR>
nmap <leader>gv :split $MYGVIMRC<CR>

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" vim-airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" NERDTree
" au VimEnter *  NERDTree
let g:NERDTreeWinSize = 70
let NERDTreeChDirMode = 2
let Tlist_Use_Right_Window = 1
nmap <leader>r :NERDTreeFind<cr>
nmap <leader>e :NERDTreeToggle<CR>

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax *.cpp call EnhanceCppSyntax()

" eclim
nmap <F3> :CSearchContext<CR>
let g:EclimCSearchSingleResult = 'vsplit'
let g:EclimFileTypeValidate = 0
let g:EclimCValidate = 0

" FuzzyFinder
"nnoremap <leader>f :FufFile **/<cr>
nnoremap <leader>f :FufFile **/loewe/common<cr>
nnoremap <leader>b :FufBuffer<cr>
nnoremap <leader>t :FufTag<cr>

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

" showmarks
" let g:showmarks_textlower = "---"
" let g:showmarks_hlline_lower = 1 
" highlight ShowMarksHLl guifg=red guibg=green
" highlight ShowMarksHLu guifg=red guibg=blue
" let g:showmarks_include="bcdefzxABJio"
" let b:showmarks_include="abcdefzxABJio"
" let showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789."

" VCS
"let VCSCommandSVNDiffExt="kompare -o -"

" vim-bbye
nnoremap <leader>q :Bdelete<CR>

" gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
