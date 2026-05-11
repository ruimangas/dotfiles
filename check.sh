#!/usr/bin/env bash
set -euo pipefail

ok=0
fail=0

check() {
  local desc="$1" result="$2"
  if [[ "$result" == "ok" ]]; then
    echo "  ok  $desc"
    (( ok++ )) || true
  else
    echo "  !!  $desc — $result"
    (( fail++ )) || true
  fi
}

echo ""
echo "symlinks"
for f in zshrc bash_aliases gitconfig vimrc; do
  target="$HOME/dotfiles/$f"
  link="$HOME/.$f"
  if [[ -L "$link" && "$(readlink "$link")" == "$target" ]]; then
    check "$link" "ok"
  else
    check "$link" "missing or not symlinked to $target"
  fi
done

nvim_link="$HOME/.config/nvim/init.vim"
nvim_target="$HOME/dotfiles/init.vim"
if [[ -L "$nvim_link" && "$(readlink "$nvim_link")" == "$nvim_target" ]]; then
  check "$nvim_link" "ok"
else
  check "$nvim_link" "missing or not symlinked to $nvim_target"
fi

echo ""
echo "local overrides"
for f in ~/.zshrc.local ~/.gitconfig.local; do
  if [[ -f "$f" ]]; then
    check "$f" "ok"
  else
    check "$f" "missing — create this file (see CLAUDE.md)"
  fi
done

echo ""
echo "local override dependencies"
for f in ~/.zshrc.local ~/.gitconfig.local; do
  [[ -f "$f" ]] || continue
  # find `source` and `path =` references to files that don't exist
  while IFS= read -r line; do
    # shell: source /path or . /path
    if [[ "$line" =~ ^[[:space:]]*(source|\\.)[[:space:]]+([^#]+) ]]; then
      dep="${BASH_REMATCH[2]// /}"
      dep="${dep/#\~/$HOME}"
      dep=$(eval echo "$dep" 2>/dev/null) || continue
      if [[ -n "$dep" && ! -e "$dep" ]]; then
        check "$dep (referenced in $f)" "missing"
      fi
    fi
    # git config: path = /path
    if [[ "$line" =~ ^[[:space:]]*path[[:space:]]*=[[:space:]]*(.+) ]]; then
      dep="${BASH_REMATCH[1]// /}"
      dep="${dep/#\~/$HOME}"
      dep=$(eval echo "$dep" 2>/dev/null) || continue
      if [[ -n "$dep" && ! -e "$dep" ]]; then
        check "$dep (referenced in $f)" "missing"
      fi
    fi
  done < "$f"
done

echo ""
echo "tools"
for tool in zsh nvim fzf rg zoxide eza bat gpg gh; do
  if command -v "$tool" &>/dev/null; then
    check "$tool" "ok"
  else
    check "$tool" "not found — install via Homebrew"
  fi
done

echo ""
if [[ $fail -eq 0 ]]; then
  echo "all checks passed"
else
  echo "$fail issue(s) found"
fi
echo ""
