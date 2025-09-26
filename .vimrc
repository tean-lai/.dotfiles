let mapleader = " "

" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
" TODO: finish plug-in things?
" not sure if i want to use plug-ins in my final setup. we will see. i do want to keep things simple overall.

set history=500

" set nocompatible  " TODO: what is this??
set number relativenumber

map <leader>y "+y
map <leader>yy "+yy
map <leader>p "+p

set so=7  " i think this is a vertical buffer for scrolling
set cmdheight=1  " height of command bar
set hid  " buffer becomes hidden when it is abandoned

set backspace=eol,start,indent  " backspace acts as it should
set whichwrap+=<,>,h,l

set ignorecase  " ignore case when searching
set smartcase
set hlsearch incsearch

set lazyredraw  " don't redraw while executing macros (good performance)
set magic  " for regular expressions turn magic on
set showmatch  " show matching brackets when text indiciators is over them
set mat=2  " how many tenths of a second to blink

set noerrorbells
set novisualbell
" set t_vb  TODO
set tm=500  " TODO:??

set nobackup nowb noswapfile

set expandtab smarttab shiftwidth=2 tabstop=2

set lbr

set ai
set si
set wrap

map <silent> <leader> q :noh<cr>  " disable highlight when <leader><cr> is pressed

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  " return to last edit position when opening files (you want this!)

set laststatus=2

" Change cursor shape depending on mode
if has("termguicolors")
  let &t_SI = "\e[6 q"   " Insert mode: vertical bar
  let &t_EI = "\e[2 q"   " Normal mode: block cursor
endif

  
