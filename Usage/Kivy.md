## Kivy framework
### Miscellany
Location:
```
import os, kivy
os.path.dirname(kivy.__file__)
```

Gstreamer:
```
yaourt -S gst-plugins-ugly
```

Examples on the system: `/usr/share/kivy-examples`

### Resources
[Reference](https://kivy.org/docs/)
[Widget positioning](https://blog.kivy.org/2014/01/positionsize-of-widgets-in-kivy/)

### Buildozer
#### [Kivy Complete VM](https://github.com/Zen-CODE/kivybits/tree/master/KivyCompleteVM)

User: `kivy` Password: `kivy`

Access to shared folders (guest):
```
$ sudo adduser kivy vboxsf
```

Update the system and install:
```
$ sudo apt-get install --reinstall libc6-i386
$ sudo apt-get install gcc-multilib
$ sudo apt-get install lib32z1
```