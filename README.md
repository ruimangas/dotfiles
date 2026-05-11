# dotfiles

My vim, zsh, and git config.

## Install on a new machine

```sh
git clone https://github.com/ruimangas/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` symlinks the configs into `$HOME`, clones Vundle, and runs
`:PluginInstall`. Existing files are backed up as `<name>.bak.<timestamp>`.
