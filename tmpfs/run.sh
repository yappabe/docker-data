#!/bin/bash
set -e
set -x

TMPFS_RAM_SIZE=${TMPFS_RAM_SIZE:-"2048"}
TMPFS_PATH=/tmpfs

echo "Mounting tmpfs with ${TMPFS_RAM_SIZE}MB of RAM."
umount ${TMPFS_PATH} 2> /dev/null|| true
mkdir -p ${TMPFS_PATH}
mount -t tmpfs -o size="${TMPFS_RAM_SIZE}m" tmpfs ${TMPFS_PATH}
chmod -R 777 ${TMPFS_PATH}
setfacl -R -m u:"www-data":rwX -m u:`whoami`:rwX ${TMPFS_PATH}
setfacl -dR -m u:"www-data":rwX -m u:`whoami`:rwX ${TMPFS_PATH}