## Vim Editor
*Neovim, mostly*

#### IntelliJ IDEA, IdeaVim plugin
`~/.ideavimrc`:
```
set clipboard+=unnamed
set ideajoin
set idearefactormode=keep
```

#### sudo
```
$ sudo -e nvim
```
#### Plugin functionality support

- [TSUpdate error, related to nvim-treesitter plugin](https://github.com/nvim-treesitter/nvim-treesitter/issues/913)
```
$ yay -S python-pynvim
$ yay -S neovim-remote
$ yay -S tree-sitter
$ yay -S tree-sitter-python-git
$ yay -S python-jedi
$ yay -S npm
```
#### Spell checking
- `init.vim`:
```
set spelllang=ru_ru,en_us,es_es
nmap <leader>ss :set invspell<CR>
```
- `*.spl` files are found in `/.local/share/nvim/site/spell`; also
```
$ locate en.utf-8.spl
/usr/share/nvim/runtime/spell/en.utf-8.spl
```
#### Clipboard

- Install `xclip` (or `xsel`)

- Add to `init.vim` to avoid printing `"+y` for the system clipboard:
```
set clipboard=unnamedplus
```

#### Sharing plugins with Vim

- [Arch Wiki](https://wiki.archlinux.org/index.php/Neovim), [Color scheme, etc.](https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim)


#### Python support (legacy)

[A Complete Guide for Installing and Setting up Neovim for Python Development](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/) (Cocless)

### VimTeX

[Superfluous viewer instances](https://github.com/lervag/vimtex/issues/313)

[**Configuration issue**](https://github.com/lervag/vimtex/issues/1392)

#### Okular

- Vim/Okular interaction (Okular > Settings > Editor > Command):
```
gvim --servername GVIM --remote-silent +%l %f
```
- Neovim/Okular, [neovim-remote installed](https://github.com/mhinz/neovim-remote):
```
nvr --remote-silent %f -c %l
```
*Shift+Left Click*; with Okular working only in *Browse* mode.

#### Misc

- Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) (*FiraMono Nerd Font* will do); [howto](https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0)

- Ensure [vim-plug](https://github.com/junegunn/vim-plug) to be installed (Auto install may fail):
```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- In case of errors on start:
```
:PlugInstall
```
- In case of errors on update:
```
:PlugClean
:PlugInstall
```
- Total cleanup:
```
$ rm -rf ~/.cache/nvim ~/.config/nvim/plugged ~/.local/share/nvim
```
AstroNvim
```
$ rm -rf ~/.cache/nvim ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim
$ git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```
- Sometimes useful:
```
:UpdateRemotePlugins
```
- Create backup folder:
```
$ mkdir ~/.local/share/nvim/backup
```
- In Neovim: `:checkhealth provider`
