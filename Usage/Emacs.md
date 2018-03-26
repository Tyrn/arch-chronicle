## Emacs
#### Miscellany
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
