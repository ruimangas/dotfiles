# git
alias gss='git status'
alias gs='gss'
alias gad='git add .'
alias gp='git push'
alias gpl='git pull'
alias gcm='git commit --verbose'
alias gd='git diff'
alias gdm='git diff master'
alias np='cd ~/dev/nu; ls'
alias gc='git clone'
alias gb='git branch'
alias gk='git checkout'
alias gkl='git checkout -'
alias gbnew='git checkout -b'
alias gst='git stash'
alias gkm='git checkout master'

# nvim
alias ivm='nvim'
alias vmi='nvim'
alias vi='nvim'

# history
alias hs='history | grep'
alias hi='history'

# misc
alias dk='cd ~/Desktop && ls'
alias dot='cd ~/dotfiles'

# auto-jq/bat: pipe through jq for json, bat for yaml
_auto_jq_wrap() {
  local cmd="$1"; shift
  local -a args=("$@")
  local wants_json=false wants_yaml=false

  for (( i=1; i<=${#args[@]}; i++ )); do
    case "${args[$((i-1))]}" in
      -o=json|--output=json) wants_json=true; break ;;
      -o=yaml|--output=yaml) wants_yaml=true; break ;;
      -o|--output)
        [[ "${args[$i]:-}" == json ]] && wants_json=true
        [[ "${args[$i]:-}" == yaml ]] && wants_yaml=true
        break ;;
    esac
  done

  if $wants_json; then
    command "$cmd" "${args[@]}" | jq
  elif $wants_yaml; then
    command "$cmd" "${args[@]}" | bat -l yaml --paging=always --pager="less -R"
  else
    command "$cmd" "${args[@]}"
  fi
}

kubectl() { _auto_jq_wrap kubectl "$@"; }
aws()     { _auto_jq_wrap aws     "$@"; }
docker()  { _auto_jq_wrap docker  "$@"; }
