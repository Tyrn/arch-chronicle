## Arduino

### Arduino IDE 2 for the Blue Pill

- [On Arch](https://kimxilxyong.medium.com/programming-stm32f7-boards-with-the-arduino-2-0-ide-on-arch-f47c221eb7c7),
[stm32duino](https://github.com/stm32duino)

- Files > Preferences > Settings > Additional boards manager URLs:
```
https://github.com/stm32duino/BoardManagerFiles/raw/main/package_stmicroelectronics_index.json
```
- Tools > Board: "Generic STM32F1 series"

- Tools > Board part number "Blue Pill F103C8"

- Tools > C Runtime Library: "Newlib Nano (default)"

- Tools > Upload method: "STM32CubeProgrammer (SWD)"

- Tools > Usb support (if available): "CDC (generic 'Serial' supersede U(S)ART)"

- Make sure the AUR version of ST-Link installed (stlink is certainly required by Cube Programmer; maybe stlink-git has something to do with Serial Monitor functionality)
```
$ yay -S stlink-git
```

### Misc

- `stm32cubeprog` AUR package, menu entries (via kmenuedit):
```
~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32CubeProgrammer
~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32TrustedPackageCreator
```
