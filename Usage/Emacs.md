## Emacs
### Doom Emacs

- [Project](https://github.com/hlissner/doom-emacs)
- [Personal Configuration](https://github.com/Tyrn/.doom.d)
- Cheat Sheets: [1](https://github.com/niyumard/Doom-Emacs-Cheat-Sheet), [2](https://gist.github.com/hjertnes/9e14416e8962ff5f03c6b9871945b165)

#### Install
- Add to `~/.xprofile`:
```
export PATH=$PATH:$HOME/.emacs.d/bin
```
```
$ cd ~
$ rm -rf .emacs.d/
$ rm -rf .doom.d/
$ git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
$ yay -S emacs
$ doom install
```
- Before creating your first project/using `M-x projectile-discover-projects-in-search-path`
```
$ cd ~/spaces
$ emacs
```

#### Miscellany

#### Obsolete
##### AUCTeX bug (?): no stepping through the compilation errors

`/etc/texmf/web2c/texmf.cnf`:

`file_line_error_style = f`

to

`file_line_error_style = t`

##### AUCTeX, Okular, forward and inverse search

`okular --unique %o#src:%n`pwd`/./%b`

##### geben, xdebug

`.emacs`:

`(autoload 'geben "geben" "PHP Debugger on Emacs" t)`

`/etc/php/conf.d/xdebug.ini`:
```
zend_extension=/usr/lib/php/modules/xdebug.so
xdebug.remote_enable=on
xdebug.remote_host=localhost
xdebug.remote_port=9000
xdebug.remote_handler=dbgp
```
Usage:

http://localhost/bimbo/test.php?XDEBUG_SESSION_START=1

##### Spacemacs

https://github.com/artempyanykh/evil-russian
