# dotfiles

## Install

```sh
git clone https://github.com/ruimangas/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

Run `~/dotfiles/check.sh` after setup to verify symlinks, local overrides, and required tools are all in place.

Symlinks configs into `$HOME`, clones Vundle, runs `:PluginInstall`.

## Machine-local overrides

Two files are not in this repo and must be created manually on each machine:

**`~/.zshrc.local`** — sourced at the end of zshrc. Use for machine-specific env vars, work tooling, and PATH additions.

**`~/.gitconfig.local`** — included at the end of gitconfig. Use for work git hooks, conditional includes, and per-machine git config.

Additional local files may be needed depending on your work setup.

## Tools required

- zsh + oh-my-zsh
- nvim + Vundle
- fzf, ripgrep, zoxide, eza, bat
- gpg + yubikey (for SSH auth and commit signing)
- Homebrew (macOS)
