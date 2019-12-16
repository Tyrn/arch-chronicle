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

[Manjaro](https://forum.manjaro.org/t/solved-how-to-install-wifi-driver-for-realtek-rtl8723de/82712/2) (obsolete); [smlinux](https://github.com/smlinux/rtl8723de) (obsolete)

- Install dkms:
```
$ sudo pacman -S dkms
```
NB `dkms` data is to be found in `/var/lib/dkms`.

- Install [the driver](https://forum.manjaro.org/t/solved-wi-fi-rtl8723de-driver-and-kernel-5-2-trouble/115220)
```
$ yaourt -S rtlwifi_new-extended-dkms
```
