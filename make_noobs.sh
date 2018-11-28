#!/bin/bash -x

if [ ! \( -f "boot-${1}.tar.size" -a -f "stage4-armv7a_hardfp-${1}.tar.size" \) ]; then
	echo "Usage: $0 version"
	echo "Note: version is assumed to start with YYYYmmdd (a date)"
	exit 1
fi

sed -e "s/@@@BOOT_SIZE@@@/$((($(<boot-${1}.tar.size)+1024*1024-1)/(1024*1024)))/" \
    -e "s/@@@ROOT_SIZE@@@/$((($(<stage4-armv7a_hardfp-${1}.tar.size)+1024*1024-1)/(1024*1024)))/" \
    noobs_os/partitions.json.in > noobs_os/partitions.json

sed -e "s/@@@DATE@@@/${1:0:4}-${1:4:2}-${1:6:2}/" \
    noobs_os/os.json.in > noobs_os/os.json
