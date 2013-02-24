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

" Statusline
set statusline=%f\ %y%r%m
set statusline+=%#error#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{GitEmailAlert()}
set statusline+=%*
set statusline+=%=%-19(%3l,%02c%03V%)

set laststatus=2

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")

    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif

    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

" Alert if the local git email is not set
function! GitEmailAlert()
  if !exists("g:gitemail_alert")
    let s:email = system("git config --local --get user.email")

    if s:email == ''
      let g:gitemail_alert = '[Configure git local email]'
    else
      let g:gitemail_alert = ''
    endif
  endif
  return g:gitemail_alert
endfunction

source ~/.vim/bundles.vim

" Tabularize shortcuts
nmap <Leader>th :Tabularize /=><CR>
vmap <Leader>th :Tabularize /=><CR>
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
