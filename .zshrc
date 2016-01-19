export ZSH=/Users/ruijosepereira/.oh-my-zsh
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases

alias myzsh="vi ~/.zshrc && source ~/.zshrc"
alias myvim="vi ~/.vimrc"

