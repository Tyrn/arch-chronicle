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
$ cd ~/development
$ tar xf ~/Downloads/flutter_linux_v0.5.1-beta.tar.xz
$ export PATH=`pwd`/flutter/bin:$PATH
```
- Install toolchain components:
```
$ yaourt -S gradle android-sdk android-sdk-build-tools android-platform
```
- Add to `.profile`:
```
export ANDROID_HOME=/opt/android-sdk
```
In case of manual installation:
```
export PATH=$PATH:/home/alexey/mobile/flutter/bin
```
- Create `sdkusers` group and add your `user`

- Accept licenses:
```
$ sudo /opt/android-sdk/tools/bin/sdkmanager --licenses
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