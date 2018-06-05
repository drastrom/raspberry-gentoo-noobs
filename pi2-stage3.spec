subarch: armv7a_hardfp
target: stage3
profile: default/linux/arm/13.0/armv7a
rel_type: rpi2
portage_confdir: /root/raspberry-gentoo-noobs/portage_conf
cflags: -march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard
# caller must specify:
# snapshot
# version_stamp
# source_subpath (rpi2/stage2-armv7a_hardfp-VERSION)
