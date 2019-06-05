subarch: armv7a_hardfp
target: stage4
profile: default/linux/arm/17.0/armv7a
rel_type: rpi2
portage_confdir: /root/raspberry-gentoo-noobs/portage_conf
cflags: -march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard
stage4/use: neon
stage4/packages:
	wpa_supplicant
	dhcpcd
	ntp
	cpupower
	raspberrypi-userland-bin
	wireless-tools
	bluez
	rng-tools
	iputils
	usbutils
	iproute2
	sudo
stage4/root_overlay: /root/raspberry-gentoo-noobs/root_overlay
#Contrary to the docs, stage4/users does not seem to be implemented
#so will have to do it in the fsscript instead
#stage4/users: pi
stage4/fsscript: fsscript.sh
stage4/rcadd:
	swclock|boot
	cpupower|default
stage4/rcdel:
	hwclock|boot
# caller must specify:
# snapshot
# version_stamp
# source_subpath (rpi2/stage3-armv7a_hardfp-VERSION)
