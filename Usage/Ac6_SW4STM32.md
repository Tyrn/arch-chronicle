## CubeMX SW4STM32 (Ac6) Eclipse project
_Arch Linux Take_

### Installation
#### Install Eclipse (legacy)
```
$ yaourt -S eclipse-java
```
Eclipse upgrade is destructive, so `/etc/pacman.conf`:
`IgnorePkg  = eclipse-java eclipse-common`

*NB* `eclipse-php` or `eclipse-cpp` will do; the latter has CDT plugins preinstalled.

#### Install Eclipse CDT plugin (legacy)

Install CDT, CDT SDK, and C/C++ Unit Testing Support via `Help > Install New Software...`

The working version: http://download.eclipse.org/tools/cdt/releases/9.3

Newer releases will ~~probably~~ work, too.

#### Install Eclipse SW4STM32 plugin (legacy)

Install System Workbench for STM32 - Bare Machine edition via `Help > Install New Software...`

http://ac6-tools.com/Eclipse-updates/org.openstm32.system-workbench.update-site-v2

[Install Emb Sys Registers plugin](https://mcuoneclipse.com/2017/07/26/embsysregview-0-2-6-for-eclipse-neon-and-oxygen/) (In `/usr/lib/eclipse/plugins`)

#### Install STM32CubeMX (legacy)
```
yaourt -S stm32cubemx
```
The utility is also available as an Eclipse plugin; the standalone application may be easier on your system, though.

NB Manual installaiton can be less troublesome:

- Unpack factory archive and install in `~/STM32CubeMX`

- Create `/usr/bin/stm32cubemx`:
```
#/usr/bin/env bash
exec $HOME/STM32CubeMX/STM32CubeMX
```
- `sudo chmod +x /usr/bin/stm32cubemx`

#### Install STM32CubeIDE

- [Download](https://aur.archlinux.org/packages/stm32cubeide) (Pinned Comment)
```
$ yay -S stm32cubeide
```
- Install ST-Link (a nice set of the [udev rules](https://probe.rs/docs/getting-started/probe-setup/), if not already there):
```
$ yay -S stlink-git
$ st-info --probe
...
  chipid:     0x410    ;; Must not be zero.
...
```
- Install STLinkUpgrade (Disconnect from the Pill before running ``$ STLinkUpgrade``!)
```
$ yay -S stsw-link007
```

### Configuration
#### Create CubeMX project

Resources:

[DAC, DMA, ADC, USB, VCP](https://habrahabr.ru/post/310742/) (3 parts, Russian)

[FreeRTOS](https://habrahabr.ru/post/249273/) (5 parts, Russian)

[Carmine Noviello. *Mastering STM32*, examples](https://github.com/cnoviello/mastering-stm32)

[Kento Watanabe. *Introduction to STM32 ARM Microcontroller with STM HAL Library & SW4STM32*, examples](https://github.com/meerstern/stm32introductory)

Example:

[Blinky](https://www.exclude.se/2017/06/02/stm32f103c8t6-st-link-v2-blinky-example/), the Blue Pill on STLink/V2

Guidelines:

- Select project location inside Eclipse workspace; the project gets imported in place.
- In case of STLink do *not* forget to set `Pinout > Configuration > Peripherals > SYS > Debug` to `Serial Wire`. See `[project].xml` in your project directory.


#### Import and configure Eclipse SW4STM32 project

- Make sure that your Eclipse is running.
- Run `Project > Generate Code` of your STM32CubeMX app.
- Once code generation is done, select `Open Project`. If everything is correct, the Eclipse project is imported hands off, no user interaction required.
- In case the Eclipse project won't import hands off after all, import it [manually](http://www.openstm32.org/Importing%2Ba%2BSTCubeMX%2Bgenerated%2Bproject). `Import > General > Existing Projects into Workspace`; `Select root directory`; all options unchecked.

#### GDB Eclipse

- Main/Project: `myproject`

- Main/Application: `Debug/myproject.elf`

- Main/Disable auto build

- Main/Mcu: `STM32F103C8Tx`

- Main/Board: `myproject`

- Debugger/GDB Command: `${openstm32_compiler_path}/arm-none-eabi-gdb`; as of 2018-10-26 `/usr/bin/arm-none-eabi-gdb`

- Debugger/OCD Command: `"${openstm32_openocd_path}/openocd"`

- Debugger/Port: `3333`

- Debugger/Configuration Script/Automated generation `check`

- Debugger/Script file: `${ProjDirPath}/galvanix Debug.cfg`

- Debugger/Interface: `SWD`

- Debugger/Frequency: `4 MHz`

- Debugger/Reset mode: `Software system reset`

- Debugger/Enable debug in low-power modes `check`

- Debugger/Stop watchdog counters when halt `check`

- Startup/Reset and delay `uncheck`

- Startup/Halt `uncheck`

#### Semihosting

[Eclipse configuration](http://alphaloewe.com/2017/01/24/enable-semi-hosting-with-openstm32-system-workbench/)

##### Eclipse Debug configuration (OpenOCD)

- Add filter: `Project properties > C/C++ General > Paths and Symbols > Source Locations: /myproject/Core` a filter: `Src/syscalls.c`

- Append to `Project properties > C/C++ Build > Settings > Tool Settings > MCU GCC Linker > Libraries: Libraries` the following: `rdimon`.

- Append to `Project properties > C/C++ Build > Settings > Tool Settings > MCU GCC Linker > Miscellaneous > Linker/Other flags` the following: ` -specs=rdimon.specs [-lc -lrdimon]` (many `-specs` options separated by space are OK).

- Add to `Debug Configurations > (New Configuration) > Startup > Run Commands` the following: `monitor arm semihosting enable`.

- Declare `extern void initialise_monitor_handles(void);` in the `main.c`.

- Call `initialise_monitor_handles();` after the `MX_GPIO_Init();` in the `int main(void)`.

- Use `printf()` for tracing; manually added `\n` is mandatory.

### TDD
#### CppUTest

[CppUTest](https://cpputest.github.io/), [CppUTest manual](https://cpputest.github.io/manual.html), [CppUTest mocking manual](https://cpputest.github.io/mocking_manual.html)

#### Unity

[Unity](http://www.throwtheswitch.org/white-papers/unity-intro.html), [Unity on GitHub](https://github.com/ThrowTheSwitch/Unity), [docs](https://github.com/ThrowTheSwitch/Unity/tree/master/docs)

#### [Ceedling](https://github.com/Tyrn/arch-chronicle/blob/master/Usage/Ceedling.md)

#### Fake Function Framework (fff)

[Fake Function Framework, GitHub](https://github.com/meekrosoft/fff)

[CMock vs fff](http://www.electronvector.com/blog/cmock-vs-fff-a-comparison-of-c-mocking-frameworks), [fff plugin for Ceedling](http://www.electronvector.com/blog/more-flexible-mocks-for-ceedling-with-the-fake-function-framework-fff), [GitHub](https://github.com/ElectronVector/fake_function_framework)

### Bits and pieces
#### FreeRTOS

[FreeRTOS](http://blog.mbedded.ninja/programming/operating-systems/freertos), ([The embedded engineering website that’s got your back](http://blog.mbedded.ninja/)), [API Reference](https://www.freertos.org/a00106.html), [CMSIS-RTOS](https://stackoverflow.com/questions/41858814/difference-between-freertos-and-cmsis-rtx)
