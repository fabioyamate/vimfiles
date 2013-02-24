execute pathogen#infect()

" Loading indent and plugins depending on the filetype
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

" Set vim-specifc functions available, breaking compatibility with vi
set nocompatible

" Fast terminal
set ttyfast

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Line number
set number
set colorcolumn=100
set cursorline

" Syntax highlighting options
syntax on
set t_Co=256

" Search Options
set incsearch
set hlsearch

" Line Wrapping options
set nowrap

" Disable visual bells
set visualbell t_vb=

" Indentation Settings
set sw=2
set sts=2
set expandtab
set autoindent
set copyindent

" rewriting <leader> key
let mapleader=","

" Display tabs and trailing spaces
set list
set listchars=tab:\ ¬,trail:.

" Buffer
set hidden

" Enabling mouse
if has('mouse')
  set mouse=nv
endif

" Disable autoindent when pasting
set pastetoggle=<F2>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

source ~/.vim/bundles.vim
