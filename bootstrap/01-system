#!/bin/sh

set -xe

TARGET_HOSTNAME="raspberrypi"
TARGET_TIMEZONE="Europe/Madrid"
ROOT_PASS=raspberry

# base stuff
apk add ca-certificates
update-ca-certificates
echo "root:$ROOT_PASS" | chpasswd
setup-hostname $TARGET_HOSTNAME
echo "127.0.0.1    $TARGET_HOSTNAME $TARGET_HOSTNAME.localdomain" > /etc/hosts
setup-keymap es es

# time
apk add chrony tzdata
setup-timezone -z $TARGET_TIMEZONE

# other stuff
apk add nano htop curl wget bash bash-completion findutils
sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd
