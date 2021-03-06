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

### Set PulseAudio per-application control
echo "Set PulseAudio for per-application control..."
configDir=~/.config/pulse/
if [ ! -d $configDir ]; then
	echo "PulseAudio user configuration folder does not exist."
	echo "Create PulseAudio configuration folder..."
	mkdir -p $configDir
fi
cp config_files/pulse/daemon.conf $configDir
unset configDir
echo "Done."

### apply the dot files
echo "Backup bashrc and vimrc..."
if [ -f ~/.bashrc ]; then cp ~/.bashrc ~/bashrc_backup; fi
if [ -f ~/.vimrc ]; then cp ~/.vimrc ~/vimrc_backup; fi
echo "Creating symbolic links for the dot files..."
ln -fs $PWD/../dotfile/dot_bashrc ~/.bashrc
ln -fs $PWD/../dotfile/dot_vimrc ~/.vimrc
ln -fs $PWD/../dotfile/dot_tmux.conf ~/.tmux.conf
ln -fs $PWD/../dotfile/dot_screenrc ~/.screenrc
ln -fs $PWD/../dotfile/dot_bash_functions ~/.bash_functions
source ~/.bashrc
echo "Done."

### install fonts
#### for Menlo fonts
for f in ~/.local/share/fonts/Menlo*; do
	if [ ! -e $f ]; then
		echo "Install fonts..."
		pushd .
		cd fonts/
		./install.sh
		popd
		echo "Done."
	fi
	break
done
#### for Inconsolata fonts
for f in ~/.local/share/fonts/Inconsolata*; do
	if [ ! -e $f ]; then
		echo "Install fonts..."
		pushd .
		cd fonts/
		./install.sh
		popd
		echo "Done."
	fi
	break
done

### create configuration for nvim
if [ ! -f ~/.config/nvim/init.vim ]; then
	echo "Create Nvim configurations..."
	mkdir -p ~/.config/nvim
	echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > ~/.config/nvim/init.vim
	echo "Done."
fi

### install Vundle plugin for organizing Vim Plugins
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
	echo "Install Vim Vundle..."
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Done."
fi

### setup nvim and install plugins
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
