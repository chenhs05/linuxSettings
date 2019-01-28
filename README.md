repository to store .bashrc .screenrc, .vimrc and .tmux.conf

The dotfile/ folder contains the dot files for various settings.

```
dotfile/
├── dot_bash_functions
├── dot_bashrc
├── dot_config.fish
├── dot_screenrc
├── dot_tmux.conf
├── dot_vimrc
├── dot_vimrc_minimal
├── dot_xprofile
├── dot_zshrc
└── tex.gitignore
```

The **dot_\*** file can be copied to **~/** and change the file name to **.\*** to become active.

Run the **fresh_install.sh** in fresh_install/ to apply all the settings,
including:
1. Install commonly used debian packages
2. Install the dot files
3. install menlo/Inconsolata powerline fonts
4. Set up neovim
5. Install vim plugins
6. Apply Solarized color scheme to gnome-terminal
