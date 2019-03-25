## Vim Editor
### Vim and Neovim
#### Sharing plugins

- [Arch Wiki](https://wiki.archlinux.org/index.php/Neovim)

- Create a symlink (to share *autoload* and plugins):
```
$ ln -s /home/alexey/.vim /home/alexey/.local/share/nvim/site
```

### VimTeX

[Superfluous viewer instances](https://github.com/lervag/vimtex/issues/313)

### Okular

- Vim/Okular interaction (Okular > Settings > Editor > Command):
```
gvim --servername GVIM --remote-silent +%l %f
```
