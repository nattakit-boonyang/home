" set color
colorscheme slate

" hidden mode
set hidden

" line number
set number
set relativenumber

" indentation and tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" set encoding
set encoding=utf8
set fileencoding=utf8

set title
set hlsearch
set showcmd
set laststatus=2
set t_Co=256
set backspace=indent,eol,start
set nowrap
set breakindent
syntax enable

" set shell
set shell=/usr/bin/zsh

" search text
set ignorecase
set smartcase

" cursor line
set cursorline
set termguicolors
set wildoptions=pum
set background=dark
set iskeyword+=-

" map custom keys
nmap <C-a> gg<S-v>G
nnoremap x "_x
nnoremap dw vb"_d

" remove remapping key for arrow keys
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

