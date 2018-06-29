#!/bin/bash

### install debian packages
sudo apt install vim neovim tmux git git-gui gitk dconf-cli
sudo apt install bash-completion exuberant-ctags
sudo apt install python3 python3-pip
# for Chinese fonts
sudo apt install fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy

### show user name in the lightdm greeter
echo "Enable the user in the lightdm greeter..."
sudo cp config_files/02_enable_users.conf /usr/share/lightdm/lightdm.conf.d/
echo "Done."

### change the swapiness to 10, which is recommended for linux desktop
echo "Changing the system swapiness..."
sudo cp config_files/90-swapiness.conf /etc/sysctl.d/
echo "Done."

### apply the dot files
echo "Applying the dot files..."
cp ../dotfile/dot_bashrc ~/.bashrc
cp ../dotfile/dot_vimrc ~/.vimrc
cp ../dotfile/dot_tmux.conf ~/.tmux.conf
cp ../dotfile/dot_screenrc ~/.screenrc
cp ../dotfile/dot_bash_functions ~/.bash_functions
source ~/.bashrc
echo "Done."

### create configuration for nvim
if [ ! -f ~/.config/nvim/init.vim ]; then
	echo "Create Nvim configurations..."
	mkdir -p ~/.config/nvim
	echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > ~/.config/nvim/init.vim
	echo "Done."
fi

### install menlo fonts
for f in ~/.local/share/fonts/Menlo_*; do
	if [ ! -e $f ]; then
		echo "Install Menlo fonts..."
		pushd .
		cd fonts_menlo/
		./install.sh
		popd
		echo "Done."
	fi
	break
done

### install Vundle plugin for organizing Vim Plugins
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
	echo "Install Vim Vundle..."
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Done."
fi

### setup nvim
sudo pip3 install neovim
nvim +PluginInstall +UpdateRemotePlugins +qall

### apply soloarized color scheme to gnome-terminal
gitRepoDir=../../
if [ ! -e $gitRepoDir/gnome-terminal-colors-solarized/ ]; then
	echo "Install gnome-terminal solarized color"
	echo "Better create a new gnome-terminal profile before installation"
	pushd .
	mkdir -p $gitRepoDir
	cd $gitRepoDir
	git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
	cd gnome-terminal-colors-solarized/
	./install.sh
	popd
	echo "Done."
fi
unset gitRepoDir
