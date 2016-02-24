export ZSH=/Users/ruijosepereira/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases
source $HOME/.bash_profile

alias myzsh="vi ~/.zshrc && source ~/.zshrc"
alias myvim="vi ~/.vimrc"
alias alia="vi ~/.bash_aliases"

