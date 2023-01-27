## Flutter
*A mobile application framework, Arch take*

- :snowflake: - supposedly obsolete entry.

### Resources

- [Understanding null safety](https://dart.dev/null-safety/understanding-null-safety)

- [Awesome Flutter on GitHub](https://github.com/Solido/awesome-flutter)

- [Flutter Awesome](https://flutterawesome.com/)

- [Awesome Flutter](https://awesomeflutter.com/)

- [Flutter Internals](https://www.didierboelens.com/2019/09/flutter-internals/)

- [Flutter by Example](https://flutterbyexample.com/)

- [Flutter Architecture, official samples](https://github.com/brianegan/flutter_architecture_samples)

- [Flutter Planets](https://github.com/sergiandreplace/flutter_planets_tutorial) :snowflake:

- [Katz, Moore & Ngo, source](https://github.com/kodecocodes/flta-materials)

- [Bueno & Palcar, source](https://github.com/kodecocodes/rwf-materials)

#### BLoC

- [Bloc Library, including Examples](https://bloclibrary.dev); [on GitHub](https://github.com/felangel/bloc)

- [About `Future<void> main() async {}`](https://stackoverflow.com/questions/56129121/good-or-bad-declaring-main-method-async-in-dart-flutter)

- [Bloc & Cubit, +Video 2018](https://resocoder.com/2020/08/04/flutter-bloc-cubit-tutorial/)

- [BLoC and Bluetooth BLE](https://lupyuen.github.io/pinetime-rust-mynewt/articles/bloc)

- [EZ Flutter](https://github.com/Ephenodrom/EZ-Flutter)

- [Unit testing with BLoC](https://medium.com/flutter-community/unit-testing-with-bloc-b94de9655d86)

- [`mapEventToState()` deprecated](https://blog.logrocket.com/introduction-flutter-bloc-8/)

- Lessons in Russian, [Video](https://youtu.be/khuaUejT3zw),
[47](https://github.com/JonFir/lazyload_flutter/tree/lesson/47-build-context),
[91](https://github.com/JonFir/lazyload_flutter/tree/arch/lesson/91-bloc-on-events),
[92](https://github.com/JonFir/lazyload_flutter/tree/arch/lesson/92-bloc-libs-cubit),
[93](https://github.com/JonFir/lazyload_flutter/tree/arch/lesson/93-bloc-libs-bloc),
[94](https://github.com/JonFir/lazyload_flutter/tree/arch/lesson/94-bloc-libs-flutter-bloc),
[95](https://github.com/JonFir/lazyload_flutter/tree/arch/lesson/95-bloc-libs-flutter-bloc-observer),
[104](https://github.com/JonFir/lazyload_flutter/tree/arch/lesson/104-dependency-managemant-get_it)

#### Very Good CLI

- [On pub.dev](https://pub.dev/packages/very_good_cli)

- [Flutter Todos Tutorial](https://bloclibrary.dev/#/fluttertodostutorial)

- [Testing](https://verygood.ventures/blog/flutter-tests-very-good-cli)

- [development/staging/production](https://verygood.ventures/blog/flutter-starter-app-very-good-core-cli)

- Install/upgrade:
```
$ dart pub global activate very_good_cli
```
- Create project:
```
$ very_good help create [flutter_app|flame_game...]
...
$ very_good create flutter_todos --desc "An example todos app that showcases bloc state management patterns."
```

- Create various projects inside `packages` (`flutter_todos/packages`) (old syntax?):
```
flutter_todos $ very_good create todos_api -o packages -t dart_pkg --desc "The interface and models for an API providing access to todos."

flutter_todos $ very_good create local_storage_todos_api -o packages -t flutter_pkg --desc "A Flutter implementation of the TodosApi that uses local storage."

flutter_todos $ very_good create todos_repository -o packages -t dart_pkg --desc "A repository that handles todo related requests."
```
- Install all the dependencies recursively:
```
$ very_good packages get -r
```
- Check Android Studio *Run > Edit Configurations...*

#### Localization

- [Flutter Intl plugin for Android Studio](https://stackoverflow.com/questions/73375594/flutter-intl-plugin-how-to-set-location-of-l10n-directory-that-is-generated)

- [Intl Utils](https://pub.dev/packages/intl_utils)
```
$ dart pub global activate intl_utils
$ dart pub global run intl_utils:generate
```

#### Crossplatform build

- Create (add) Linux project:
```
my_project $ flutter create --platforms=linux .
```
- [Building Linux apps with Flutter](https://docs.flutter.dev/development/platform-integration/linux/building)

- [Native vs Host](https://wiki.loliot.net/docs/lang/flutter/engine/flutter-app-for-linux-arm64/)

- [Issue #74929](https://github.com/flutter/flutter/issues/74929)

- [eLinux](https://github.com/sony/flutter-elinux)

#### Redux :snowflake:

[Flutter Redux](https://github.com/brianegan/flutter_redux)

[Redux & testing Hello World](https://github.com/xrigau/todo_demo_flutter_redux); [Shopping Cart](https://github.com/pszklarska/FlutterShoppingCart); [Simplified one](https://github.com/csnguyen-gmail/flutter_redux_architecture)

[Official Redux example](https://github.com/brianegan/flutter_architecture_samples/tree/master/example/redux)

### Installation (mostly :snowflake:)

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
- Check:
```
$ cat /etc/profile.d/android-sdk-platform-tools.sh 
export PATH="${PATH}:/opt/android-sdk/platform-tools"
```
- Add to `.profile`:
```
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:/home/alexey/mobile/flutter/bin
```
- Relax permissions for Android SDK:
```
$ sudo groupadd sdkusers
$ sudo gpasswd -a $USER sdkusers
$ sudo chown -R :sdkusers /opt/android-sdk/
$ sudo chmod -R g+w /opt/android-sdk/
```
or just like this:
```
$ sudo chown -R $USER /opt
```
- Accept licenses:
```
$ flutter doctor --android-licenses

```
- Check:
```
$ ls -l /opt/android-sdk/
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

### Troubleshooting :snowflake:

- `Error retrieving device properties for ro.product.cpu.abi Permission denied...`
Check your target Android device settings; replug.

- Wrong Android API version. Change `android/defaultConfig/minSdkVersion` in `my_project/android/app/build.gradle` (once) generated file.

- `adb` permissions error:
```
Error retrieving device properties for ro.product.cpu.abi:
error: insufficient permissions for device
See [http://developer.android.com/tools/device.html] for more information
```
Kill (start, if appropriate) the `adb`.
```
$ adb kill-server
($ sudo adb start-server)
```
Keep your Android device USB settings as MTP (Files).

- Trouble (2018-10-28) with `~/mobile/flutter/packages/flutter_tools/gradle/flutter.gradle`: [add google() to buildscript repositories](https://github.com/flutter/flutter/issues/23095)

