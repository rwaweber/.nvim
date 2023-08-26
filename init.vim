call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-sensible'
Plug 'guns/vim-sexp'

" clojure and lisp tooling
Plug 'Olical/conjure', {'tag': 'v4.14.1'}
Plug 'clojure-vim/vim-jack-in'
Plug 'wlangstroth/vim-racket'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'tag' : 'v1.28' }

" color themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='seagull'
let g:go_fmt_command = "goimports"

" Requires node to get running!
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-rust-analyzer',
            \'coc-go',
            \'coc-yaml',
            \'coc-pyright',
            \'coc-conjure'
            \]

call plug#end()

let maplocalleader=","

set encoding=utf-8
syntax on
filetype plugin indent on
set mouse=a

map <C-I> :Explore<CR>
map <C-N> :bn<CR>
map <C-P> :bp<CR>
" navigate splits when holding ctrl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" using tabedit with C-n and C-p because recovering from emacs
" set colors
set t_Co=256
"colorscheme onehalfdark
colorscheme seoul256
set background=dark
" show existing tab with 4 spaces width
set tabstop=4
" use backspace
set bs=2
" On pressing tab, insert 4 spaces
set shiftwidth=4
set expandtab
" Set arbitrary line marker
set colorcolumn=80

set statusline+=%{coc#status()}

set list
set listchars=tab:›\ ,eol:¬,space:.,trail:*

" Always open splits to the right
set splitright

map <F5> :CocDiagnostics<CR>

" have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

  au BufReadPost *.rkt,*.rktl set filetype=racket
  au filetype racket set lisp
  au filetype racket set autoindent
endif
