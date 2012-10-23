set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set t_Co=256

filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle bundles
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-fugitive'
Bundle 'hallison/vim-markdown'
Bundle 'gregsexton/MatchTag'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'sudo.vim'
Bundle 'golden-ratio'
Bundle 'nu42dark-color-scheme'
colorscheme nu42dark

" Syntax
filetype plugin indent on
syntax on
set guifont=Lucida\ Console

" Editor tweaks
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set gdefault

" disable auto commenting
" makes copy-paste a bit easier
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Search options
set smartcase
set incsearch
set hlsearch
set showmatch

" Folding
set foldmethod=syntax
set foldlevelstart=3

" Beeping
set visualbell t_vb=

" UI enhancements
set number
set ttyfast
set ruler
set formatoptions=qrn1
set scrolloff=3
" set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest

" Status line
set laststatus=2
let g:Powerline_symbols = 'fancy'

" GVIM
if has('gui_running')
    set lines=70 columns=190
    set guioptions-=T " No Toolbar
    set guioptions-=m " No Menubar
endif

" Tab navigation
nmap <M-1> :tabfirst<CR>
nmap <M-2> 2gt
nmap <M-3> 3gt
nmap <M-4> 4gt
nmap <M-5> 5gt
nmap <M-6> 6gt
nmap <M-7> 7gt
nmap <M-8> 8gt
nmap <M-9> :tablast<CR>

" Plugins
nnoremap <silent> <F6> :JSLintToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

" Leader binds

" Search/replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" SVN commit current file
nnoremap <Leader>c :!svn commit % -m ""<Left>

nmap <Leader>\ :noh<CR>

let s:sites = {'amo':'actionmethod', 'network':'network'}
function! Upload(box)
    for entry in items(s:sites)
        if match(expand('%:p'), '/'.entry[0].'/') > -1
            let a:target=substitute(expand('%:p'), '.*/'.entry[0].'/', 'root@dev'.a:box.':/var/www/vhosts/'.entry[1].'/sandbox/',"")
            silent exe '!rsync -az -e ssh --exclude "*.swp" % '.a:target
            break
        endif
    endfor
endfunction
nnoremap <silent> <F10> :call Upload(10)<CR>

" Windows
if has('win32') || has('win64')
    set lines=60 columns=120
    if has('gui_win32')
        set guioptions-=T " No Toolbar
        set guioptions-=m " No Menubar
        set guifont=Consolas:h10
    endif
    let g:PowerLine_symbols = 'compatible'
    cd ~
endif

" vim: set ft=vim :
