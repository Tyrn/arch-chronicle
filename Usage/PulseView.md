## Patching PulseView on Archlinux

Patch:

- [Kingst LA1010 support for Sigrok](https://github.com/AlexUg/sigrok)
- [Patched libsigrok](https://github.com/AlexUg/libsigrok)
- [KingstVIS configuration extractor](https://github.com/AlexUg/sigrok/blob/master/fwextractor.py) (`fwextractor.py`)

Manufacturer's downloads (KingstVIS for Linux 3.5.x required):

- [Current downloads](http://www.qdkingst.com/en/download)
- [Legacy](http://www.qdkingst.com/en/vis-old)

PulseView configuration, extracted from KingstVIS app, downloaded from the manufacturer:
```
$ ls ~/.local/share/sigrok-firmware/kingst 
fw01A1.fw   fw03A1.fw           LA2016A1.bitstream
fw01A1.hex  fw03A1.hex          LA2016.bitstream
fw01A2.fw   LA1010A0.bitstream  LA5016A1.bitstream
fw01A2.hex  LA1010A1.bitstream  LA5016.bitstream
fw01A3.fw   LA1010A2.bitstream  LA5032A0.bitstream
fw01A3.hex  LA1016A1.bitstream  MS6218.bitstream
fw01A4.fw   LA1016.bitstream
```

Required AUR package `pulseview-git` depends on `libsigrok-git`:
```
$ yay -S pulseview-git
$ yay -Qi pulseview-git
Name            : pulseview-git
Version         : 0.3.0.r1110.ga6fa4d47-1
...
Depends On      : libsigrok-git  libsigrokdecode-git  qt5-base
                  boost-libs  qt5-svg
...
```
Create your own sandbox:

