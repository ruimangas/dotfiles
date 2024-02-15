filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-surround'
Bundle 'github/copilot.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-fugitive'
Bundle 'dense-analysis/ale'
Bundle 'm00qek/baleia.nvim', { 'tag': 'v1.3.0'}
Bundle 'Olical/conjure', {'tag': 'v4.23.0'}
Bundle 'tomtom/tcomment_vim'
Bundle 'janko-m/vim-test'
Bundle 'ervandew/supertab'
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
set ma
set hlsearch
set visualbell
set ruler
set nobackup
set nowritebackup
set backspace=indent,eol,start
set noswapfile
set list
set encoding=utf-8
set listchars=tab:›\.,trail:.,extends:#,nbsp:.
set autoindent
set wildmenu
set autoread
set splitright
set splitbelow
set notimeout
set ttimeout
set ttimeoutlen=10
set so=7

let mapleader=','
let maplocalleader = "/"
set background=dark
colorscheme onehalfdark

imap jk <ESC>

let s:baleia = luaeval("require('baleia').setup { }")
autocmd BufWinEnter my-buffer call s:baleia.automatically(bufnr('%'))

map <leader>[ <CR>iimport ipdb; ipdb.set_trace()<CR><ESC>
map <leader>p F<space><space>i#nu/tapd<space><esc>

" remove all nu taps
map <leader>rp :%s/#nu\/tapd<space>//g<CR><ESC>
map <leader>r[ :g/ipdb/d<CR><ESC>

" spell errors
setlocal spell spelllang=en_us
hi SpellBad cterm=underline ctermfg=yellow
autocmd FileType markdown setlocal spell

" Search path
nnoremap <c-p> :GFiles<cr>

" Search lines all files
nnoremap <leader>fal :Lines<cr>

" Search lines all buffers
nnoremap <leader>fbi :BLines<cr>

nnoremap <leader>b :Buffer<CR>

" Search all files
nnoremap <leader>faf :Ag <space>

" Search all files word under the cursor
nnoremap <leader>fw :Ag <C-r><C-w><cr>

" saving and quit
nnoremap <leader>w  :w<cr>
nnoremap <leader>q  :wq<cr>
nnoremap <leader>fq :q!<cr>

" Running specs
nnoremap <silent> <leader>T :TestNearest<CR>
nnoremap <silent> <leader>t :TestFile<CR>
nnoremap <silent> <leader>v :TestVisit<CR>
nnoremap <silent> <leader>las :TestLast<CR>

" Alternative buffer with backspace
nnoremap <bs> <c-^>

" Clear search highlights
nnoremap <leader><space> : :nohlsearch<cr>

" Edit and source vim config
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" Search and replace on current file
nnoremap <leader>ss :%s/\<<C-r><C-w>\>//g<Left><Left>

" Open project explorer
nnoremap <leader>ef :Vexplore<CR>
nnoremap <leader>eg :Sexplore<CR>

" Open file on current dir
cnoremap <expr> %% expand('%:h').'/'

map <leader>ed :vsp %%
map <leader>eh :sp %%

" format an entire file
nnoremap <leader>fef ggVG=

" Remove all whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Reload file and throw away any changes
nnoremap <leader>rel :edit!<cr>

" Sometimes I forgot my leader commands
map <leader>lea :!grep --color leader ~/dotfiles/vimrc <cr>

" Custom mappings
nnoremap <C-f> /
nnoremap <C-h> B
nnoremap <C-l> W
nnoremap Y y$
nnoremap \\ $
nnoremap qq  _

" Center display after searching
nnoremap + *zz
nnoremap n   nzz
nnoremap N   Nzz

" long lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Do not show that stupid window
map q: :q

autocmd Filetype gitcommit setlocal spell textwidth=72

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
set wildignore+=*.DS_Store                        " OSX bullshit
set wildignore+=*.pyc                             " Python byte code
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " Images
set wildignore+=.hg,.git,.svn                     " Version control stuff

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

map <leader>ren :call RenameFile()<cr>

function! SearchClojureWord()
  exe "set iskeyword-=/"
  let var = expand("<cword>")
  exe "set iskeyword+=/"
  return "".var.""
endfunction

nnoremap <leader>fec :exec 'Ag' SearchClojureWord()<CR>

let g:sexp_enable_insert_mode_mappings = 0

let g:ale_linters = {'clojure': ['clj-kondo']}

"git commands
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Commits<CR>

" History
nnoremap <leader>hi :History<CR>
nnoremap <leader>hs :History/<CR>

let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'clojure': v:true,
    \ }
