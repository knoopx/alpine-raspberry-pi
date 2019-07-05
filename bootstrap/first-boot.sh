#!/bin/sh

set -xe

apk add dosfstools e2fsprogs-extra parted

cat <<EOF > /usr/bin/first-boot
#!/bin/sh
set -xe

parted ---pretend-input-tty /dev/mmcblk0 resizepart 2 yes 100%
partprobe
resize2fs /dev/mmcblk0p2
rc-update del first-boot
rm /etc/init.d/first-boot /usr/bin/first-boot

fallocate -l 1g /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo "/swapfile       none            swap    sw                0       0" >> /etc/fstab

cp -f /boot/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

reboot
EOF

cat <<EOF > /etc/init.d/first-boot
#!/sbin/openrc-run
command="/usr/bin/first-boot"
command_background=false
depend() {
  after modules
  need localmount
}
EOF

chmod +x /etc/init.d/first-boot /usr/bin/first-boot
rc-update add first-boot
