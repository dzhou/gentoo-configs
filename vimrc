
set nocompatible  
set background=dark
set bs=2            " backspacing over everything in insert mode
set ai              " Auto indenting
set showmatch       " show () {} and [] matches while writing
set history=100     " keep 100 lines of history
set ruler           " show the cursor position
syntax on           " syntax highlighting
set number
filetype on
filetype plugin indent on

set tabpagemax=15 
set showtabline=2 
set noerrorbells
set nocompatible
set si
set cindent
set mouse=a
set nowrap
set incsearch
set showmatch
set mat=5
set wrap
"set hls
"set cul
"set wrapscan
"set sol

"PEP8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set smartindent
set softtabstop=4
set shiftwidth=4


"syntax
"hi Comment ctermfg=green
"hi PreProc ctermfg=magenta cterm=bold ctermfg
"hi Comment ctermfg=green cterm=bold

colorscheme koehler

"Custom


"Key Mapping
nnoremap <F2> :w <ENTER>
nnoremap <silent> <c-l> :TlistToggle <ENTER>
nnoremap <silent> <c-d> :NERDTreeToggle <ENTER>

function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction

nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

