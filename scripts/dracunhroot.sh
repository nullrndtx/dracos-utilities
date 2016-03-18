#!/bin/sh
# Leave the DracOS chroot Environment
# rndtx - rndtx@dracos-linux.id

# Checking root
if [ "$(id -u)" != 0 ]; then
	echo "ERROR! Run this script with root user!"
	exit 1
fi

export dracos=/mnt/dracos
umount $dracos/sys
umount $dracos/proc
umount $dracos/dev/shm
umount $dracos/dev/pts
umount $dracos/dev
umount $dracos
