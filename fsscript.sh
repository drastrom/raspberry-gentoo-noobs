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
sed -i '/^s[01]:/ s/^/#/' /etc/inittab

mkdir /lib/rc/cache
touch /lib/rc/cache/shutdowntime

# DAMN unicode names make NOOBS angry
rm -f /usr/share/ca-certificates/mozilla/*Hizmet*
rm -f /usr/share/ca-certificates/mozilla/*Class_Gold*
find /etc/ssl/certs/ -xtype l -delete
update-ca-certificates

cd /etc/init.d
ln -sf net.lo net.eth0
ln -sf net.lo net.wlan0
cd /dev
ln -sf ttyAMA0 serial1
