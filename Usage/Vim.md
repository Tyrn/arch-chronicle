## Vim Editor
### Vim and Neovim
#### sudo
```
$ sudo -E nvim
```
#### Spell checking
- `init.vim`:
```
"set invspell spelllang=ru_ru,en_us
set spelllang=ru_ru,en_us
nnoremap 99 :set invspell<CR>
```
#### Clipboard

- Install `xsel` (or `xclip`)

- Add to `init.vim` to avoid printing `"+y` for the system clipboard:
```
set clipboard=unnamedplus
```

#### Sharing plugins

- [Arch Wiki](https://wiki.archlinux.org/index.php/Neovim), [Color scheme, etc.](https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim)

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
