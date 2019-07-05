#!/bin/sh

set -xe

FIRST_USER_NAME=pi

apk add sudo

for GRP in spi i2c gpio; do
	addgroup --system $GRP
done

adduser -s /bin/bash -D $FIRST_USER_NAME

for GRP in adm dialout cdrom audio users video games input gpio spi i2c netdev; do
  adduser $FIRST_USER_NAME $GRP
done

echo "pi:raspberry" | /usr/sbin/chpasswd
echo "pi ALL=NOPASSWD: ALL" >> /etc/sudoers
