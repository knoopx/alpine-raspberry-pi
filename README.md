Alpine Raspberry PI

This is a system install of Alpine linux for Raspberry Pi 0, 1, 2
(`armv7`) and 3B, 3B+ and 4 (`aarch64`) image ready to burn
to an SD card via [balenaEtcher](https://www.balena.io/etcher/) (there's
no need to gunzip image).

The image automatically setup and configures:

* root user [pwd: raspberry]
* pi user [pwd: raspberry]
* ethernet
* wifi (edit `wpa_supplicant.conf` in the boot partition, on first boot it will be copied)
* bluetooth
* avahi
* swap
* openssh server
* root partition auto-expand on first boot
