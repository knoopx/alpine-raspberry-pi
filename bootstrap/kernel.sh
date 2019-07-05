#!/bin/sh

set -xe

echo "dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait" > /boot/cmdline.txt

cat <<EOF > /boot/config.txt
disable_splash=1
boot_delay=0
EOF

# fstab
cat <<EOF > /etc/fstab
/dev/mmcblk0p1  /boot           vfat    defaults          0       2
/dev/mmcblk0p2  /               ext4    defaults,noatime  0       1
EOF
