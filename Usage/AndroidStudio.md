## Android Studio
*IDE for mobile development (mostly flutter)*

- :snowflake: - supposedly obsolete entry.

### Install

- Get JetBrains Toolbox:
```
$ yay -S jetbrains-toolbox
```
After installation via JetBrains Toolbox the running path will look like this:
```
~/.local/share/JetBrains/Toolbox/apps/AndroidStudio/ch-0/221.6008.13.2211.9514443/bin/studio.sh
```
- Create a convenient soft link in home directory:
```
$ ln -s .local/share/JetBrains/Toolbox/apps/AndroidStudio/ch-0/221.6008.13.2211.9514443 AndroidStudio
```
- Create a starting script, to be visible for *dmenu*:
```
$ cat /usr/local/bin/android-studio
#!/usr/bin/env bash
exec ~/AndroidStudio/bin/studio.sh
```
- In case of [Unable to find bundled Java version on Flutter](https://stackoverflow.com/questions/51281702/unable-to-find-bundled-java-version-on-flutter) trouble, create a soft link:
```
$ cd ~/AndroidStudio
$ ln -s jbr jre
```
- Make sure *File > Settings > Appearance & Behavior > System Settings > Android SDK > SDK Tools > Android SDK Command Line Tools (latest)* gets checked and installed;

- With `flutter doctor`, `cmdline-tools` component is probably still [missing](https://stackoverflow.com/questions/68236007/i-am-getting-error-cmdline-tools-component-is-missing-after-installing-flutter); make it available:
```
$ flutter config --android-sdk ~/Android/Sdk
```
- The relevant part of `~/.xprofile` may look like this (mostly unnecessary?):
```
export PATH=/opt/flutter/bin:$PATH
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest:$PATH
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
```
- Manage permissions (relogin required):
```
$ sudo groupadd flutterusers
$ sudo gpasswd -a $USER flutterusers
```
- Check:
```
$ flutter doctor
```