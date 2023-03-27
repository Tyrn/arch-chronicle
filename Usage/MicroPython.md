## MicroPython

### On Linux

- Clone [MicroPython](https://github.com/micropython/micropython) into `~`, and build it

- Check result (and run it):
```
$ where micropython
~/micropython/ports/unix/build-standard/micropython
```

### Embedded (mostly ESP32), the easiest way 

- Install [esptool](https://github.com/espressif/esptool):
```
$ yay -S esptool
```
- Install [Thonny IDE](https://linuxhint.com/micropython-esp32-thonny-ide/):
```
$ yay -S thonny
```
- Consult [downloads](https://micropython.org/download/) (scroll down)

- Download [ESP32 firmware, generic](https://micropython.org/download/esp32/), e.g. to `~/Downloads`

#### Reference

- [ESP-IDF](https://www.espressif.com/en/products/sdks/esp-idf), Espressif IoT Development Framework (MicroPython build tool)

- [Thonny Wiki](https://github.com/thonny/thonny/wiki)

- [Thonny, Upload multiple files/folders to esp32 at once](https://groups.google.com/g/thonny/c/7gyz0THi22M?pli=1)

- [micropython-lib](https://pypi.org/user/micropython-lib/) (What is it?)

- [MicroPython Stubber](https://github.com/Josverl/micropython-stubber)

- [MicroPython Stubs](https://github.com/Josverl/micropython-stubs)

- Unit testing not working as expected, [#10275](https://github.com/orgs/micropython/discussions/10275)

- [micropy-cli](https://www.agilepartner.net/en/micropython-esp8266-and-vscode/)

#### Examples

- [Thonny, multifile project](https://techexplorations.com/guides/esp32/micropython-with-the-esp32/14-micropython-programming-with-files/)

- [ESP32 BLE](https://techtotinker.com/2021/08/025-esp32-micropython-esp32-bluetooth-low-energy/)
