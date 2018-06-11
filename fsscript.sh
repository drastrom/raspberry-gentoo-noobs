#!/bin/bash

if [ "$(getent group games | cut -d: -f1)" != "games" ]
then
	echo "Adding games group"
	groupadd -g 35 games
fi
if [ "$(getent group plugdev | cut -d: -f1)" != "plugdev" ]
then
	echo "Adding plugdev group"
	groupadd plugdev
fi
useradd -G users,wheel,audio,plugdev,games,cdrom,disk,floppy,usb -g 100 -c "Default raspberry user" -m pi
chown -R pi:users /home/pi

/usr/sbin/chpasswd <<END
root:raspberry
pi:raspberry
END


sed -i '/NOPASSWD: ALL/ s/^# //' /etc/sudoers
