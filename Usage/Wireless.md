## Wireless HowTo
#### Checking

- Networks and switches:
```
$ rfkill list all
0: phy0: Wireless LAN
        Soft blocked: no
        Hard blocked: no
1: hci0: Bluetooth
        Soft blocked: no
        Hard blocked: no
```
- Hardware:
```
$ inxi -Fxz
...
  Device-2: Realtek RTL8723DE 802.11b/g/n PCIe Adapter 
  vendor: Hewlett-Packard driver: rtl8723de v: v5.1.1.8_21285.20171026 
  port: 2000 bus ID: 03:00.0 
  IF: wlp3s0 state: up mac: <filter>
...
```

#### Realtek RTL8723DE

[Manjaro](https://forum.manjaro.org/t/solved-how-to-install-wifi-driver-for-realtek-rtl8723de/82712/2):

- Install dkms:
```
$ sudo pacman -S dkms
```
- Install the linux headers for the current kernel:

```
$ sudo pacman -S linux$(uname -r| grep -o -E '[0-9]+' | head -n 2 | sed 'N;s/\n//')-headers
```
- Install driver:
```
$ git clone https://github.com/smlinux/rtl8723de.git -b 4.15-up
$ sudo dkms add ./rtl8723de
$ sudo dkms install rtl8723de/5.1.1.8_21285.20171026_COEX20170111-1414
$ sudo depmod -a
```
- Reboot