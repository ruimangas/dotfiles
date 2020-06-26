export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases
source $HOME/.nurc

alias myzsh="vi ~/.zshrc"
alias myvim="vi ~/dotfiles/vimrc"
alias alia="vi ~/.bash_aliases"

alias vis="source ~/.vimrc"
alias zshs="source ~/.zshrc"
alias bas="source ~/.bash_aliases"

export PATH=~/bin:$PATH

export PATH=$PATH:~/bin

export PATH="/usr/local/bin:$PATH"
