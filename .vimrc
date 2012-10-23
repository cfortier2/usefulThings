set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'golden-ratio'
Bundle 'nu42dark-color-scheme'
colorscheme nu42dark

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache
"                        first) for foo
" :BundleClean(!)      - confirm(or auto-approve)
"                        removal of unused bundles

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set modelines=0

set guifont=Lucida\ Console
let mapleader = ","

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set formatoptions=qrn1

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set laststatus=2

" Display the working git branch in the status bar
set statusline=%F%m%r%h%w
set guioptions-=L
set guioptions-=r
set guioptions-=t

" Always show line numbers
set number

" Disable wordwrap
set nowrap

" set list
" set listchars=tab:▸\ ,eol:¬

"map <S-Enter> O<Esc>
"map <CR> o<Esc> 

set norestorescreen

" if has("terminfo")
"   let &t_Co=8
"   let &t_Sf="\e[3%p1%dm"
"   let &t_Sb="\e[4%p1%dm"
" else
"   let &t_Co=8
"   let &t_Sf="\e[3%dm"
"   let &t_Sb="\e[4%dm"
" endif

"nnoremap <leader>ft Vatzf
"nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
"nnoremap <leader>w <C-w>v<C-w>l

"if exists(":Tabularize")
"  nmap <Leader>a= :Tabularize /=<CR>
"  vmap <Leader>a= :Tabularize /=<CR>
"  nmap <Leader>a: :Tabularize /:\zs<CR>
"  vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

nnoremap <leader>a :Ack
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q.<CR>

nmap <Leader>nt :tabnew<CR>

nnoremap <leader>c<space> :NERDComToggleComment

augroup userruby
au! BufRead,BufNewFile *.ru setfiletype ruby
au! BufRead,BufNewFile Gemfile setfiletype ruby
au! BufRead,BufNewFile Capfile setfiletype ruby
augroup END   

augroup userphp
au! BufRead,BufNewFile *.ctp setfiletype php
augroup END 

map <leader><tab> :tabn <CR>
map <leader>p<tab> :tabp <CR>

"set t_Co=256
syntax on

highlight clear
"if exists("syntax_on")
"  syntax reset
"endif
