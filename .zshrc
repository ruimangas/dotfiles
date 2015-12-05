export ZSH=/Users/ruijosepereira/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin"

source $ZSH/oh-my-zsh.sh

source $HOME/.bash_aliases

alias myzsh="vi ~/.zshrc && source ~/.zshrc"
alias myvim="vi ~/.vimrc"
