#!/bin/sh

set -xe

FIRST_USER_NAME=pi
FIRST_USER_PASS=raspberry

apk add sudo

for GRP in spi i2c gpio; do
	addgroup --system $GRP
done

adduser -s /bin/ash -D $FIRST_USER_NAME

for GRP in adm dialout cdrom audio users video games input gpio spi i2c netdev; do
  adduser $FIRST_USER_NAME $GRP
done

echo "$FIRST_USER_NAME:$FIRST_USER_PASS" | /usr/sbin/chpasswd
echo "$FIRST_USER_NAME ALL=NOPASSWD: ALL" >> /etc/sudoers