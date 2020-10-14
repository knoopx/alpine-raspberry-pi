#!/bin/sh

set -xe

apk add openssh haveged

for service in devfs dmesg mdev; do
	rc-update add $service sysinit
done

for service in modules sysctl hostname bootmisc swclock syslog swap; do
	rc-update add $service boot
done

for service in dbus haveged sshd chronyd local networking avahi-daemon bluetooth wpa_supplicant wpa_cli; do
	rc-update add $service default
done

for service in mount-ro killprocs savecache; do
	rc-update add $service shutdown
done
