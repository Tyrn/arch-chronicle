## IBus
#### Plasma

- Input Method Panel plasmoid

- Plasma: put the Input Method Panel widget onto main panel; disable the default keyboard manager by removing all layouts, shortcuts, and Show Layout Indicator checkbox. Icon IBus Panel should be hidden and left alone (just so, but the Input Method Panel lives a life of its own). You can still configure input method by right clicking on the language label.

##### 2017-10-28

After an upgrade the earlier layout scheme ceased to function (KDE)

##### The remedial actions (actually all wrong!):
```
$ yaourt -R fcitx fcitx-qt5 kcm-fcitx
```
-  `~/.profile`:
```
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
#exec ibus-daemon -drx &
```
##### From ArchWiki (Ibus/Kimpanel):

- To get a menu entry for launching IBus this way, save the following file to `~/.local/share/applications/ibus-kimpanel.desktop`:
```
[Desktop Entry]
Encoding=UTF-8
Name=IBus (KIMPanel)
GenericName=Input Method Framework
Comment=Start IBus Input Method Framework
Exec=ibus-daemon --panel=/usr/lib/kimpanel-ibus-panel
Icon=ibus
Terminal=false
Type=Application
Categories=System;Utility;
X-GNOME-Autostart-Phase=Applications
X-GNOME-AutoRestart=false
X-GNOME-Autostart-Notify=true
X-KDE-autostart-after=panel
```
- Finally, add the input panel widget to show the panel.

- Make sure that *System settings > Input devices > Keyboard > Layouts > Shortcuts for Switching Layout* are all set to None.

##### 2018-03-17

Actually installed relevant packages:

- `ibus`
- `ibus-m17n`
- `ibus-qt`

#### Light IDEs

- `~/.profile` (is not compatible with Plasma, probably outdated anyway):
```
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
exec ibus-daemon -drx &
```
- Change IBus Panel icon to red (do it first thing before
setting Preferences):
```
$ dconf write /desktop/ibus/panel/xkb-icon-rgba "'#FF0000'"
$ ibus read-config
```
- `/etc/dconf/db/ibus.d/00-upstream-settings` appears to be useless.
