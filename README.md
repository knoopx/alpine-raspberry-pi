# Alpine Raspberry PI

A very customizable set of scripts to build a [System Disk Mode](https://wiki.alpinelinux.org/wiki/Installation#System_Disk_Mode) installation image of Alpine Linux for the Raspberry Pi, ready to be burnt to an SD.

# Features

* Lightweight and memory-friendly Alpine Linux distribution
* Supports Raspberry Pi 3B, 3B+, and 4
* Easy setup with pre-configured system dependencies
* Root and regular user accounts
* Ethernet and WiFi connectivity with editable `wpa_supplicant.conf` from the FAT32 boot partition
* Bluetooth support
* Avahi for network service discovery
* Swap support
* OpenSSH server
* Auto-expanding root partition on first boot
* Flasheable via [balenaEtcher](https://www.balena.io/etcher/) without having to gunzip the image
* `Dockerfile` for building the image under Docker on any OS

# Untested/Unsupported

* Desktop Environment
* Audio
* Virtualization
