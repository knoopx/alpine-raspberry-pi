#!/bin/sh

set -xe

echo "modules=loop,squashfs,sd-mod,usb-storage root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes console=tty1 rootwait quiet" > /boot/cmdline.txt

cat <<EOF > /boot/config.txt
[pi3]
kernel=vmlinuz-rpi
initramfs initramfs-rpi
[pi3+]
kernel=vmlinuz-rpi
initramfs initramfs-rpi
[pi4]
enable_gic=1
kernel=vmlinuz-rpi4
initramfs initramfs-rpi4
[all]
arm_64bit=1
include usercfg.txt
EOF

cat <<EOF > /boot/usercfg.txt
EOF

# fstab
cat <<EOF > /etc/fstab
/dev/mmcblk0p1  /boot           vfat    defaults          0       2
/dev/mmcblk0p2  /               ext4    defaults,noatime  0       1
EOF

apk add linux-rpi linux-rpi4 raspberrypi-bootloader
cd /boot/overlays && find -type f \( -name "*.dtb" -o -name "*.dtbo" \) | cpio -pudm /boot