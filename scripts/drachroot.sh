#!/bin/sh
# Enter the DracOS chroot Environment

# Checking root
if [ "$(id -u)" != 0 ]; then
	echo "ERROR! Run this script with root user!"
	exit 1
fi

export dracos=/mnt/dracos
mount /dev/sda2 $dracos
mount --bind /dev $dracos/dev
mount -t devpts devpts $dracos/dev/pts
mount -t tmpfs shm $dracos/dev/shm
mount -t proc proc $dracos/proc
mount -t sysfs sysfs $dracos/sys
chroot "$dracos" /usr/bin/env -i \
	HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
	PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin \
	/bin/bash --login

