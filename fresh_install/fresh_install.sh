#!/bin/bash

### install debian packages
sudo apt install vim neovim tmux git git-gui gitk


### show user name in the lightdm greeter
echo "Enable the user in the lightdm greeter..."
sudo cp config_files/02_enable_users.conf /usr/share/lightdm/lightdm.conf.d/
echo "Done."


### apply the dot files
echo "Applying the dot files..."
cp ../dotfile/dot_bashrc ~/.bashrc
cp ../dotfile/dot_vimrc ~/.vimrc
cp ../dotfile/dot_tmux.conf ~/.tmux.conf
cp ../dotfile/dot_screenrc ~/.screenrc
cp ../dotfile/dot_bash_functions ~/.bash_functions
echo "Done."


### install menlo fonts
echo "Install Menlo fonts..."
pushd .
cd fonts_menlo/
./install.sh
popd
echo "Done."


### For Vim Plugins
echo "Install Vim Vundle..."
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Done."

echo "Install gnome-terminal solarized color"
pushd .
mkdir -p ~/git-repos/
cd ~/git-repos/
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized/
./install.sh
popd
echo "Done."
