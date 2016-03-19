set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
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
set showmatch
set autoread
set splitright
set splitbelow

set encoding=utf-8
set notimeout
set ttimeout
set ttimeoutlen=10

let mapleader=','
set background=dark
colorscheme solarized

imap jk <ESC>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

:nnoremap <leader>w  :w<cr>
:nnoremap <leader>q  :wq<cr>
:nnoremap <leader>fq :q!<cr>

:nnoremap <leader>ma :!make<cr>

:nnoremap <leader><space> : :nohlsearch<cr>

nnoremap <leader>ve :vsp $MYVIMRC<CR>
nnoremap <leader>vr :source ~/.vimrc<CR>

:setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex setlocal spell


" Search and replace on current file
:nnoremap <Leader>ss :%s/\<<C-r><C-w>\>//g<Left><Left>

" Search all files
:nnoremap <Leader>sal :grep -R <C-r><C-w> .<CR>

" Edit current split in a new tab
nnoremap <C-t> :tab split <CR>

nnoremap Y y$
nnoremap uh $
nnoremap ui  _

" Do not show that stupid window
map q: :q

" Remove all whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>as :tabnext<cr>

let g:ctrlp_working_path_mode = '0'

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
set wildignore+=*.DS_Store                        " OSX bullshit
set wildignore+=*.pyc                             " Python byte code
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " Images
set wildignore+=.hg,.git,.svn                     " Version control stuff
