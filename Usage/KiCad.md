## KiCad
### Install
Temporary situation with KiCad 5.0.0 rc2; make sure `wxpython` is replaced with `wxpython-gtk2`. The following AUR packages make a viable set:
```
kicad-scripting-git
kicad-symbols-git
kicad-footprints-git
```
#### FreeRouter
```
$ yaourt -S freeroute-bin --noconfirm
```

### Files

- `*.dcm` descriptions, aliases and keywords for library symbols

- `*.bck` backup for `*.dcm`

- `*.pro` project

- `*.sch` schematic

- `*.bak` backup for `*.sch`

- `*.lib` schematic symbols library

- `*.dsn` Specctra Design

- `*.ses` Specctra Session

- `*.net` netlist

[Complete reference](http://kicad-pcb.org/help/file-formats/)
