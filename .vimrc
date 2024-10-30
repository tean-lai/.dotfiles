set history=500

" enable filetype plugins
filetype plugin on
filetype indent on

set autoread " smth about file being changed from outside
au FocusGained,BufEnter * silent! checktime  " not sure what this does

let mapleader = " "



set nocompatible
set number
syntax enable
set tabstop=2 expandtab shiftwidth=2 smarttab
set hlsearch "highlight search
set incsearch "incremental search

set hidden "not sure what this does



set nowrap "do not wrap lines
set ignorecase "ignore capital letters during search


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7 " i think this is like a veritcal buffer for scrolling


" turn on wild menu
set wildmenu
set wildignore=*.o,*~,*.pyc  " ignore compiled files
set wildignore+=*/.git,*,*/.DS_STORE

set ruler " always show current position
set cmdheight=1  " height of command bar
set hid " buffer comes hidden when it is abandoned

set backspace=eol,start,indent " backspace acts as it should
set whichwrap+=<,>,h,l

set ignorecase " ignore case when searching
set smartcase " be smart about cases
set hlsearch
set incsearch

set lazyredraw " don't redraw while executing macros (good performance)
set magic " for regular expressions turn magic on
set showmatch " show matching brackets when text indicators is over them
set mat=2 " how many tenths of a second to blink

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a bit of extra margin to left
" set foldcolumn=1


