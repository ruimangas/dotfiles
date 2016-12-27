export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases
source $HOME/dotfiles/functions

alias myzsh="vi ~/.zshrc"
alias myvim="vi ~/.vimrc"
alias alia="vi ~/.bash_aliases"

alias vis="source ~/.vimrc"
alias zshs="source ~/.zshrc"
alias bas="source ~/.bash_aliases"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
