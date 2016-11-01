export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases
source $HOME/.bash_profile

alias myzsh="vi ~/.zshrc"
alias myvim="vi ~/.vimrc"
alias alia="vi ~/.bash_aliases"

alias vis="source ~/.vimrc"
alias zshs="source ~/.zshrc"
alias bas="source ~/.bash_aliases"


export NVM_DIR="/Users/ruijosepereira/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
