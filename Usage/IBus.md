## IBus
[ArchWiki](https://wiki.archlinux.org/index.php/IBus)
#### Plasma

- Install IBus: `$ yay -S ibus ibus-m17n`

`/etc/environment`:
```
GTK_IM_MODULE=ibus
QT_IM_MODULE=ibus
XMODIFIERS=@im=ibus
```
- Create `~/.config/autostart/ibee.sh` (to be added to System Settings > Startup and Shutdown > Autostart > Login Scripts; default Properties are OK):
```
#!/usr/bin/env bash
sleep 10
exec ibus-daemon -drxR
```
- Make it executable:
```
ᐅ chmod +x ibee.sh
```
- Relogin and check:
```
ᐅ ls $XDG_RUNTIME_DIR/systemd/generator.late
...
ᐅ systemctl status --user "app-ibee.sh@autostart.service"
```
- Change IBus Panel icon to red:
```
$ dconf write /desktop/ibus/panel/xkb-icon-rgba "'#FF0000'"
$ ibus read-config
```
- `/etc/dconf/db/ibus.d/00-upstream-settings` appears to be useless.

#### Awesome

[Awesome nm-applet](https://stackoverflow.com/questions/30550878/awesome-desktop-manager-widgets), [Awesome tutorial](https://awesomewm.org/apidoc/documentation/07-my-first-awesome.md.html)


- Copy `/etc/xdg/awesome/rc.lua` to `~/.config/awesome/rc.lua
`

- Create `~/.config/awesome/autorun.sh`:
```
#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

exec ibus-daemon -drx

```

- Add to `~/.config/awesome/rc.lua`:
```
awful.util.spawn("nm-applet")
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
```
