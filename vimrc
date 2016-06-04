set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'fatih/vim-go'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vinegar'
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
set smartcase
set hlsearch
set visualbell
set nobackup
set nowritebackup
set noswapfile
set list
set encoding=utf-8
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set autoindent
set wildmenu
set autoread
set splitright
set splitbelow

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

:nnoremap <leader>ma :w<cr>:!sh ~/Desktop/Thesis/dissertation-document/toPdf.sh<cr>

:nnoremap <leader><space> : :nohlsearch<cr>

nnoremap <leader>ve :vsp $MYVIMRC<CR>
nnoremap <leader>vr :source ~/.vimrc<CR>

:setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

" Search and replace on current file
:nnoremap <Leader>ss :%s/\<<C-r><C-w>\>//g<Left><Left>

" Search all files
:nnoremap <Leader>sal :grep -R <C-r><C-w> .<CR>

" Edit current split in a new tab
nnoremap <C-t> :tab split <CR>

nnoremap <C-f> /
nnoremap <C-h> B
nnoremap <C-l> W

" long lines
nnoremap j gj
nnoremap k gk

nnoremap Y y$
nnoremap 0 $
nnoremap qq  _

" format an entire file
nmap <leader>fef ggVG=

" Do not show that stupid window
map q: :q

" Remove all whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>as :tabnext<cr>

let g:ctrlp_working_path_mode = '0'

" go configs
au FileType go nmap <leader>r <Plug>(go-run)
:autocmd FileType go set nolist
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" ruby rspec configs
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype go setlocal ts=4 sw=4 sts=0 expandtab
au BufRead,BufNewFile *.go set filetype=go

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
set wildignore+=*.DS_Store                        " OSX bullshit
set wildignore+=*.pyc                             " Python byte code
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " Images
set wildignore+=.hg,.git,.svn                     " Version control stuff
set wildignore+=go/pkg                            " Go static files
set wildignore+=go/bin                            " Go bin files
