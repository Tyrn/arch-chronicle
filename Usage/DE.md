## Desktop Environments
### LXDE

- `/etc/xdg/lxsession/LXDE/autostart`:
```
@lxpanel --profile LXDE
@pcmanfm --desktop --profile lxde
@xscreensaver -no-splash
@xinput --set-prop --type=int --format=8  "SynPS/2 Synaptics TouchPad" "Synaptics Edge Scrolling" 1 0 0
@setxkbmap -model evdev -layout us,ru -variant , -option -option grp:caps_toggle
@gkrellm
@qstardict
```

- `~/.config/lxpanel/LXDE/panels`

- `~/.config/openbox/lxde-rc.xml`

- `~/.config/lxsession/LXDE/desktop.conf`:
```
[Session]
window_manager=compiz ccp --indirect-rendering
OR window_manager=openbox-lxde
```

- No KDM entry: just copy `/usr/share/xsessions/LXDE.desktop` to `/usr/share/apps/kdm/sessions/LXDE.desktop`

##### Places where `*.desktop` files live:

- `/usr/share/applications`
- `~/.local/share/applications`
- `/usr/local/share/applications`

##### Keyboard Layout (.bashrc):
```
setxkbmap -option grp:switch,grp:caps_toggle,grp_led:scroll us,ru
```
- The above messes with the Alt key, grp:switch removed:
```
setxkbmap -option grp:caps_toggle,grp_led:scroll us,ru
```

### Fluxbox
```
$ sudo pacman -S feh network-manager-applet alltray
```
- From AUR: `fluxmod-styles` `fbxkb`

- `~/.fluxbox/startup`:
```
...
# Adjust TouchPad:
xinput --set-prop --type=int --format=8  "SynPS/2 Synaptics TouchPad" "Synaptics Edge Scrolling" 1 1 0       #     vertical, horizontal, corner - values: 0=disable  1=enable

# Set keyboard layout:
# setxkbmap -option grp:caps_toggle,grp_led:scroll us,ru

...
idesk &
exec fbsetbg /home/alexey/common/System/Appearance/Wallpapers/sant_angelo_bridge-1400x1050.jpg &
# exec fbxkb &
# exec /opt/dropbox/dropboxd &
# exec /usr/bin/dropbox &
exec /home/alexey/.dropbox-dist/dropboxd &
exec nm-applet &
exec gkrellm -g +1287+0 &
# exec xscreensaver -no-splash &
exec gis-weather &
exec volumeicon &

export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE="ibus"
exec ibus-daemon -drx &
exec fluxbox
...
```
- `~/.fluxbox/apps`:
```
...
[group]
  [app] (name=xterm) (class=XTerm)
[end]
[group]
  [app] (name=geany) (class=Geany)
[end]
```
- `~/.fluxbox/init`:
```
...
session.screen0.toolbar.tools:	RootMenu, prevworkspace, workspacename, nextworkspace, iconbar, systemtray, clock
session.screen0.strftimeFormat: %F %a %k:%M
```

- System styles (`~/.fluxbox/init` (`session:styleFile`)): `Panbox` (very light), `Megatron-red2` (dark red)

