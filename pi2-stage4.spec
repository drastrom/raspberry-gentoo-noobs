subarch: armv7a_hardfp
target: stage4
profile: default/linux/arm/13.0/armv7a
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
stage4/root_overlay: /root/raspberry-gentoo-noobs/root_overlay
# caller must specify:
# snapshot
# version_stamp
# source_subpath (rpi2/stage3-armv7a_hardfp-VERSION)
