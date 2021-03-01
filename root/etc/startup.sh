#!/bin/sh

set -e

busybox mkdir -p /tmp
busybox mkdir -p /proc
busybox mkdir -p /sys
busybox mkdir -p /dev
busybox mkdir -p /etc/ssl

busybox mount -t proc proc /proc
busybox mount -t sysfs sysfs /sys
busybox mount -t tmpfs none /dev

busybox mdev -s

busybox ifconfig lo 127.0.0.1
busybox ifconfig eth0 up
busybox udhcpc -s /etc/udhcpc.sh

if [ ! -e /urbit.tgz ]
then
	echo Downloading Urbit
	busybox wget -O urbit.tgz http://bootstrap.urbit.org/ci/urbit-v1.2-x86_64-linux-c9c11837b.tgz
	[ `busybox sha256sum urbit.tgz | busybox head -c 64` = abf73566281630b9f616c8fea13b228fdc392dfc8a6c5397727f660a0bd25412 ]
	busybox tar xf urbit.tgz
	busybox mv urbit-v1.2-x86_64-linux urbit
fi
