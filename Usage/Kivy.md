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

#### Building [Buildozer](https://github.com/kivy/buildozer) from source
*2019-10-9*; *Python 3*

- Configure toolchain:
```
$ archlinux-java status
Available Java environments:
  java-13-jdk
  java-8-openjdk (default)
```
Everything C/C++ assumed (`autoconf` certainly features prominently :smiley_cat:)

- Supply `libtinfo` (`archlinuxcn` repo required):
```
$ sudo pacman -S ncurses5-compat-libs
```
- Supply LLVM linker:
```
$ sudo pacman -S lld
```
- Clone:
```
$ cd
$ git clone https://github.com/kivy/buildozer
$ cd buildozer
$ python setup.py build
$ sudo pip install -e .
```
- `cd` to your (first ever) project directory, then
```
$ buildozer init
```
- Edit `buildozer.spec`:
```
android.accept_sdk_license = True
```
- Build:
```
$ buildozer android debug
```
NB The first run ever takes a lot of time. Android SDK/NDK gets downloaded, all the specific tools get compiled. Some build results go into the global `~/.buildozer` directory, some in the project `.buildozer` directory. The `*.apk` target goes into the project `bin` directory. You will certainly need `cython` as a dependency, global or in the project virtual environment; probably also `pygame` (deprecated).


#### Building Buildozer docker image

- Build basic image:
```
$ cd
$ git clone https://github.com/kivy/buildozer
$ cd buildozer
$ docker build --tag=buildozer .
$ docker run --volume "$(pwd)":/home/user/hostcwd buildozer --version
```
- Create a project:
```
[pong]$ docker run --volume "$(pwd)":/home/user/hostcwd buildozer init
```
- Edit `buildozer.spec`:
```
android.accept_sdk_license = True
```
- Build:
```
[pong]$ docker run --volume "$(pwd)":/home/user/hostcwd buildozer android debug
```
- Check the containers:
```
$ docker ps -a
```
- Commit the container where the successful build happened, like this:
```
$ docker commit angry_black tyrn/buildozer:propio
$ docker images
```
- Run it like this on any project:
```
$ docker run --volume "$(pwd)":/home/user/hostcwd tyrn/buildozer:propio android debug
```