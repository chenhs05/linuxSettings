repository to store .bashrc .screenrc, .vimrc and .tmux.conf

The dotfile/ folder contains the dot files for various settings.

```
dotfile/
├── bash_functions.bash
├── dot_bashrc
├── dot_config.fish
├── dot_screenrc
├── dot_tmux.conf
├── dot_tmux_functions
├── dot_vimrc
├── dot_xprofile
├── dot_zshrc
└── tex.gitignore
```

The **dot_\*** file can be copied to **~/** and change the file name to **.\*** to become active.

The **bash_functions.bash** and **dot_tmux_functions** are loaded by the .bashrc,
they should be put into ~/scripts/ and change to file names of
**bash_functions.bash** and **tmux_functions.bash**
