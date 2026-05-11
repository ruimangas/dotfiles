#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dst="$2"
  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    echo "ok  $dst"
    return
  fi
  if [[ -e "$dst" || -L "$dst" ]]; then
    mv "$dst" "$dst.bak.$(date +%s)"
    echo "backed up existing $dst"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "link $dst -> $src"
}

link "$DOTFILES/zshrc"        "$HOME/.zshrc"
link "$DOTFILES/bash_aliases" "$HOME/.bash_aliases"
link "$DOTFILES/gitconfig"    "$HOME/.gitconfig"
link "$DOTFILES/vimrc"        "$HOME/.vimrc"
link "$DOTFILES/init.vim"     "$HOME/.config/nvim/init.vim"

if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
  git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
fi

vim +PluginInstall +qall

echo "done"
