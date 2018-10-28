## Flutter
*A mobile application framework, Arch take*
### Resources

[Everything on GitHub](https://github.com/Solido/awesome-flutter)

[Flutter Architecture, official samples](https://github.com/brianegan/flutter_architecture_samples)

[Flutter Planets](https://github.com/sergiandreplace/flutter_planets_tutorial)

#### Redux

[Flutter Redux](https://github.com/brianegan/flutter_redux)

[Redux & testing Hello World](https://github.com/xrigau/todo_demo_flutter_redux); [Shopping Cart](https://github.com/pszklarska/FlutterShoppingCart); [Simplified one](https://github.com/csnguyen-gmail/flutter_redux_architecture)

[Official Redux example](https://github.com/brianegan/flutter_architecture_samples/tree/master/example/redux)

### Installation

- [Flutter on Linux](https://flutter.io/setup-linux/):
```
$ mkdir ~/mobile
$ cd ~/mobile
$ tar xf ~/Downloads/flutter_linux_v0.5.1-beta.tar.xz
$ export PATH=`pwd`/flutter/bin:$PATH
```
- Install toolchain components:
```
$ yaourt -S gradle android-sdk android-sdk-build-tools android-sdk-platform-tools android-platform
```
- Relax permissions for Android SDK:
```
$ sudo groupadd sdkusers
$ sudo gpasswd -a user sdkusers
$ sudo chown -R :sdkusers /opt/android-sdk/
$ sudo chmod -R g+w /opt/android-sdk/
```
- Add to `.profile`:
```
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:/home/alexey/mobile/flutter/bin
```
- Relax permissions for Android SDK:
```
$ sudo groupadd sdkusers
$ sudo gpasswd -a user sdkusers
$ sudo chown -R :sdkusers /opt/android-sdk/
$ sudo chmod -R g+w /opt/android-sdk/
```
- Accept licenses:
```
$ flutter doctor --android-licenses

```
- Check:
```
$ ls -l android-sdk/
total 24
drwxrwxr-x 2 root   sdkusers 4096 Oct  2  2017 add-ons
drwxrwxr-x 3 root   sdkusers 4096 Oct 28 13:03 build-tools
drwxr-xr-x 2 alexey users    4096 Oct 28 13:07 licenses
drwxrwxr-x 3 root   sdkusers 4096 Oct 28 13:02 platforms
drwxrwxr-x 5 root   sdkusers 4096 Oct 28 13:05 platform-tools
drwxrwxr-x 6 root   sdkusers 4096 Oct 28 13:05 tools

```
- Upgrade whenever you wish:
```
$ flutter upgrade
```

### Workflow

- Create project:
```
$ flutter create my_project
$ cd my_project
```
- Check your toolchain and target device:
```
$ flutter doctor -v
```
Never mind Android Studio: it is not mandatory after all.

- Install dependencies (according to `pubspec.yaml`):
```
$ flutter packages get
```
- Upgrade dependencies:
```
$ flutter packages upgrade
```
- Check installed dependencies:
```
$ flutter pub pub deps
```
- Build and run:
```
$ flutter run
```

### Troubleshooting

- `Error retrieving device properties for ro.product.cpu.abi Permission denied...`
Check your target Android device settings; replug.

- Wrong Android API version. Change `android/defaultConfig/minSdkVersion` in `my_project/android/app/build.gradle` (once) generated file.