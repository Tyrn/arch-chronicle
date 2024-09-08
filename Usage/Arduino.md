## Arduino

### Arduino IDE 2 for the Blue Pill

- [stm32duino](https://github.com/stm32duino), forum, wiki, bits and pieces
- [Arduino Core STM32](https://github.com/stm32duino/Arduino_Core_STM32);
  [URL](https://github.com/stm32duino/Arduino_Core_STM32#getting-started) for _Files > Preferences > Settings > Additional boards manager URLs_
  (make sure that core release is indeed > 2.0.0)

- Arch Linux packages.
  Make sure the AUR version of ST-Link installed
  (stlink is certainly required by STM32CubeProgrammer; maybe `stlink-git` has something to do with Arduino Serial Monitor functionality)

```
$ yay -S arduino-ide-bin
$ yay -S stlink-git
```

- [Arduino IDE 2.x extensions](https://www.stm32duino.com/viewtopic.php?t=2201), particularly Vim plugin

```
cp -r ~/.vscode-oss/extensions/asvetliakov.vscode-neovim-1.1.3-universal ~/.arduinoIDE/extensions
```

- Arduino IDE directories:
  - `~/Arduino` for projects
  - `~/Arduino/libraries` for libraries, installed manually or otherwise

### Blue Pill Onboard (HID) Bootloader

- [HID Bootloader](https://github.com/Serasidis/STM32_HID_Bootloader),
  [releases](https://github.com/Serasidis/STM32_HID_Bootloader/releases),
  [**permissions**](https://github.com/Serasidis/STM32_HID_Bootloader#linux-udev-setup),
  [experience](https://www.stm32duino.com/viewtopic.php?t=2168&sid=7427ef62c2bd3e6ce43c6ab105b2731a)

#### Deploy HID Bootloader via ST-Link

- Download and unzip the latest [release](https://github.com/Serasidis/STM32_HID_Bootloader/releases), then

```
$ cd stm32_binaries/F103/low_and_medium_density
```

- Upload

```
$ st-flash write hid_generic_pc13.bin 0x8000000
```

- If something goes wrong, erase. Then upload again.

```
$ st-flash erase
```

If `erase` fails, try moving BOOT0 jumper; after erasing, put it back.

#### Project settings for HID Bootloader (Arduino IDE 2, Tools menu)

- Board: "Generic STM32F1 series"
- Port: "/dev/tty/ACM0" (grayed out)
- Debug symbols and core logs: "None"
- Optimize: "Smallest (-Os default)"
- Board part number: "BluePill F103C8"
- C Runtime Library: "Newlib Nano (default)"
- **Upload method: "HID Bootloader 2.2"**
- USB support (if available): "CDC (generic 'Serial' supersede U(S)ART)"
- U(S)ART support: "Enabled (generic 'Serial')"
- USB speed (if available): "Low/Full Speed"

In case ST-Link is preferable, just select **Upload method: STM32CubeProgrammer (SWD)**

### Libraries

- [HD44780_LCD_PCF8574](https://github.com/gavinlyonsrepo/HD44780_LCD_PCF8574)

- [LiquidCrystalIO](https://github.com/davetcc/LiquidCrystalIO)

### Misc

- `stm32cubeprog` AUR package, menu entries (via kmenuedit):

```
~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32CubeProgrammer
~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32TrustedPackageCreator
```
