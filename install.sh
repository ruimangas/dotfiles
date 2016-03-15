dir=~/dotfiles
olddir=~/dotfiles_old
files=".bashrc .bash_aliases .tmux_conf .vimrc .zshrc"
vim_folder=".vim"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  if [ -f ~/$file ]
  then
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
  fi
done

echo "Moving vim folder to ~"
cp -r $vim_folder ~

echo "All done."

