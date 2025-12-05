" Reminder that if you don't know what something is, you can always do search, for example:
"   :help nocompatible
"
" On maintenace:
" - :PlugUpdate and :PlugClean for plugins

let mapleader = " "

" FILE FOLDING SCRIPT {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" ========== PLUGINS START ========== {{{
" Install plugin-manager and plugins if not there
let data_dir = "~/.vim"
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
  Plug 'prabirshrestha/vim-lsp'
  " Plug 'dense-analysis/ale'  " async lint?
  Plug 'preservim/nerdtree'
  Plug 'sbdchd/neoformat'
call plug#end()
" ========== PLUGINS END =========== }}}

" BASICS {{{
set expandtab smarttab shiftwidth=2 tabstop=2 softtabstop=2
set autoindent smartindent

set history=500

" set nocompatible  " TODO: what is this??
set number relativenumber



set scrolloff=7
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

set noerrorbells novisualbell
" set t_vb  TODO
set tm=500  " TODO:??

set nobackup nowb noswapfile
set undodir=~/.vim/undo_dir undofile

" set wildmenu wildmode=list:longest  something about file completion
" set wildignore=*.docx,*.jpg,*.png,*.gif,*.pyc,*.exe,*.flv,*.img,*.xlsx

set lbr

set wrap

map <silent> <leader> q :noh<cr>  " disable highlight when <leader><cr> is pressed

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  " return to last edit position when opening files (you want this!)

set laststatus=2

" Change cursor shape depending on mode
if has("termguicolors")
  let &t_SI = "\e[6 q"   " Insert mode: vertical bar
  let &t_EI = "\e[2 q"   " Normal mode: block cursor
endif

set clipboard=unnamedplus

" }}}

" ========== LSP Configuration =========== {{{
" if executable('pylsp')
"   " pip install python-lsp-server
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'pylsp',
"     \ 'cmd': {server_info->['pylsp']},
"     \ 'allowlist': ['python'],
"     \ })
" endif
" 
" if executable('ocamllsp')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'ocamllsp',
"     \ 'cmd': {server_info->['ocamllsp']},
"     \ 'allowlist': ['ocaml'],
"     \ })
" endif
" 
" function! s:on_lsp_buffer_enabled() abort
"   setlocal omnifunc=lsp#complete
"   nmap <buffer> gd <plug>(lsp-definition)
"   nmap <buffer> gr <plug>(lsp-references)
"   nmap <buffer> gi <plug>(lsp-implementation)
"   nmap <buffer> gt <plug>(lsp-type-definition)
"   nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"   nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"   nmap <buffer> K <plug>(lsp-hover)
" endfunction
" 
" augroup lsp_install
"   au!
"   " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"   autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END

" }}}

" MAPPINGS {{{
map <leader>y "+y
map <leader>yy "+yy
map <leader>p "+p
" nnoremap <leader>
map <leader>b :NERDTreeToggle<cr>
map <leader>fmt :Neoformat<cr>

" }}}

" OPAM settings {{{
" ## added by OPAM user-setup for vim / base ## d611dd144a5764d46fdea4c0c2e0ba07 ## you can edit, but keep this line
let s:opam_share_dir = system("opam var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_available_tools = []
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if isdirectory(s:opam_share_dir . "/" . tool)
    call add(s:opam_available_tools, tool)
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 80e30fc874a232f29b78572d2409e293 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/tean/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
" }}}

" formatter {{{
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" let g:opambin = substitute(system('opam config var bin'),'\n$','','''')
" let g:neoformat_ocaml_ocamlformat = {
"             \ 'exe': g:opambin . '/ocamlformat',
"             \ 'no_append': 1,
"             \ 'stdin': 1,
"             \ 'args': ['--disable-outside-detected-project', '--name', '"%:p"', '-']
"             \ }
" 
" let g:neoformat_enabled_ocaml = ['ocamlformat']

" }}}
