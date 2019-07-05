#!/bin/sh

set -xe

TARGET_HOSTNAME="raspberrypi"

# base stuff
apk add ca-certificates
update-ca-certificates
echo "root:raspberry" | chpasswd
setup-hostname $TARGET_HOSTNAME
echo "127.0.0.1    $TARGET_HOSTNAME $TARGET_HOSTNAME.localdomain" > /etc/hosts
setup-keymap es es

# time
apk add chrony tzdata
setup-timezone -z Europe/Madrid

# other stuff
apk add nano htop curl wget bash bash-completion
sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd
