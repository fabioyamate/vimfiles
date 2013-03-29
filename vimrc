execute pathogen#infect()

" Loading indent and plugins depending on the filetype
filetype plugin indent on

syntax enable
colorscheme ir_black

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

" No arrow key allowed! (tries: 1)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" rewriting <leader> key
let mapleader=","

" Display tabs and trailing spaces
set list
set listchars=tab:\ ¬,trail:.

" Buffer
set hidden

" Enabling mouse
" if has('mouse')
"   set mouse=nv
" endif

" Disable autoindent when pasting
set pastetoggle=<F2>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Better command-line completion
set wildmode=list:longest
set wildmenu

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore binstubs
set wildignore+=*/b/*

" Ignore temp and log files
set wildignore+=*/tmp/*,*/log/*

" Disable temp and backup files
set wildignore+=*.bak,*.swp,*~,._*,#*#

" Statusline
set statusline=%f\ %y%r%m
set statusline+=%#error#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{GitEmailAlert()}
set statusline+=%*
set statusline+=%=%-19(%3l,%02c%03V%)

set laststatus=2

" register comments strategy
autocmd FileType go set commentstring=\/\/\ %s

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>"

" CtrlP
let g:ctrlp_show_hidden = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
      \ }

" Tabularize shortcuts
nmap <Leader>th :Tabularize /=><CR>
vmap <Leader>th :Tabularize /=><CR>
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>

" maps ; to work the same way as :
nnoremap ; :

" splits made easy
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" BufExplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='name'
let g:bufExplorerSplitOutPathName=1

nmap <silent> <C-b> :BufExplorer<CR>
