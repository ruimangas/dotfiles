# git
alias gss='git status'
alias gs='gss'
alias gad='git add .'
alias gp='git push'
alias gpl='git pull'
alias gcm='git commit --verbose'
alias gd='git diff'
alias gdm='git diff master'
alias gc='git clone'
alias gb='git branch'
alias gk='git checkout'
alias gkl='git checkout -'
alias gbnew='git checkout -b'
alias gst='git stash'
alias gkm='git checkout master'

# vim
alias ivm='vim .'
alias vmi='vim .'
alias vi='vim .'

# kubernetes
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias kgj='kubectl get jobs'
alias wkgp='watch "kubectl get pods"'
alias wkgn='watch "kubectl get nodes"'
alias wkgj='watch "kubectl get jobs"'
alias wkrp='watch "kubectl get pods --field-selector=status.phase=Running"'
alias kgc='gcloud container clusters get-credentials '

# history
alias hs='history | grep'
alias hi='history'

# gcloud
alias gclis='gcloud compute instances list | grep'
alias gcli='gcloud compute instances list'

# current projs
alias pi='cd ~/pipelines; ls'
alias ol='cd ~/Desktop/open_layer; ls'
alias pr='cd ~/Desktop/python_bigquery_runner; ls'
alias sd='cd ~/Desktop/scrappy-doo; ls'

# tmux
alias ta="tmux a -t"
alias tn="tmux"
alias tl="tmux ls"
alias tk="tmux kill-session -t"

# misc
alias dk='~/Desktop; ls'
alias dot='~/dotfiles'
alias drop='~/dropbox; ls'
