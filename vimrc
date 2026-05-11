filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vinegar'
Bundle 'tomtom/tcomment_vim'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Bundle 'junegunn/fzf', { 'do': { -> fzf#install() } }
Bundle 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

syntax on

set showmode
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=
set smartcase
set hlsearch
set visualbell
set ruler
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start
set list
set encoding=utf-8
set listchars=tab:›\.,trail:.,extends:#,nbsp:.
set autoindent
set wildmenu
set autoread
set splitright
set splitbelow
set so=7
set synmaxcol=200
set lazyredraw

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git"'

let mapleader=','
set background=dark
colorscheme onehalfdark

" escape insert mode
imap jk <ESC>

" fzf
nnoremap <c-p> :Files<cr>
nnoremap <leader>faf :Ag <space>
nnoremap <leader>fw :Ag <C-r><C-w><cr>

" save / quit
nnoremap <leader>w  :w<cr>
nnoremap <leader>q  :wq<cr>
nnoremap <leader>fq :q!<cr>

" alt buffer
nnoremap <bs> <c-^>

" clear search highlight
nnoremap <leader><space> :nohlsearch<cr>

" reload file, drop changes
nnoremap <leader>rel :edit!<cr>

" jump to first non-blank of line
nnoremap qq _

" yank to end of line (matches D, C)
nnoremap Y y$

" center display after searching
nnoremap + *zz
nnoremap n nzz
nnoremap N Nzz

" long lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" spell
setlocal spell spelllang=en_us
hi SpellBad cterm=underline ctermfg=yellow
autocmd FileType markdown setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType go setlocal nolist

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
set wildignore+=*.DS_Store,*.pyc
set wildignore+=.hg,.git,.svn
