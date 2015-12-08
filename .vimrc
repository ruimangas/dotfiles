set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-dispatch'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'thoughtbot/vim-rspec'
Bundle 'vim-ruby/vim-ruby'

call vundle#end()
filetype plugin indent on

syntax on

set showmode
set number
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set ignorecase
set hlsearch
set visualbell
set nobackup
set nowritebackup
set noswapfile
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set autoindent
set wildmenu

let mapleader=','
set background=dark
colorscheme solarized

imap jk <ESC>

:nnoremap <leader>w  :w<cr>
:nnoremap <leader>q  :wq<cr>
:nnoremap <leader>fq :q!<cr>

:nnoremap <leader>ma :!make<cr>

:nnoremap <leader><space> : :nohlsearch<cr>

nnoremap <leader>ve :vsp $MYVIMRC<CR>
nnoremap <leader>vr :source ~/.vimrc<CR>

:setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex setlocal spell

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabnext<cr>

let g:ctrlp_working_path_mode = '0'

map <Leader>a :call RunAllSpecs()<CR>

nnoremap <space>gss  :Gstatus<CR>
nnoremap <space>gd   :Gdiff<CR>
nnoremap <space>gad  :Git add %:p<CR><CR>
nnoremap <space>gcm  :Gcommit<CR>
nnoremap <space>gp   :Dispatch! git push<CR>
nnoremap <space>gpl  :Dispatch! git pull<CR>
