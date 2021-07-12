#!/bin/sh

set -xe

apk add dosfstools e2fsprogs-extra parted

cat <<EOF > /usr/bin/first-boot
#!/bin/sh
set -xe

cat <<PARTED | sudo parted ---pretend-input-tty /dev/mmcblk0
unit %
resizepart 2
Yes
100%
PARTED

partprobe
resize2fs /dev/mmcblk0p2
rc-update del first-boot
rm /etc/init.d/first-boot /usr/bin/first-boot

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
