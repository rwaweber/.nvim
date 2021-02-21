call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-sensible'
Plug 'guns/vim-sexp'

Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'ludovicchabant/vim-gutentags'

" Requires node to get running!
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-rust-analyzer',
            \'coc-go',
            \'coc-yaml',
            \'coc-pyright'
            \]


Plug 'fatih/vim-go', { 'tag' : 'v1.24' }

" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

call plug#end()

set encoding=utf-8
syntax on
filetype plugin indent on

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
endif
