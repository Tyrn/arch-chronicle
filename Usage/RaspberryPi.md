## Raspberry Pi miscellany
### VirtualBox

#### (Arch) Linux Host:

-  Install VirtualBox as per instruction

- Create `vboxsf` group by installing `virtualbox-guest-utils`

- `$ sudo gpasswd -a user vboxsf`; relogin

#### Debian Guest:

- Create an appropriate virtual machine; check [*Raspberry Pi Desktop*](https://www.raspberrypi.org/downloads/) architecture, as a 32-bit distribution runs *almost*  fine on a 64-bit virtual machine :smile:

- Install and update *Raspberry Pi Desktop* (Debian)

- Download [Guest Additions (6.0.4 here)](https://download.virtualbox.org/virtualbox/6.0.4/VBoxGuestAdditions_6.0.4.iso), insert them into the virtual CD drive, and install:
```
# sh /media/cdrom0/VBoxLinuxAdditions.run
```

- In case you want to change screen resolution:
```
# nano /etc/default/grub
```
```
GRUB_GFXMODE=1152x864x32   # or something
```
```
# update-grub
```

- In case you cannot enter your shared folder(s):
```
$ sudo usermod -aG vboxsf pi
```

- In case you want to see more:
```
$ sudo VBoxControl sharedfolder list
```