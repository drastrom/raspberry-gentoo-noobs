subarch: armv7a_hardfp
target: stage1
profile: default/linux/arm/17.0/armv7a
rel_type: rpi2
portage_confdir: /root/raspberry-gentoo-noobs/portage_conf
common_flags: -O2 -pipe -march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard
compression_mode: xz
#update_seed: yes
#update_seed_command: --update --deep @world
# caller must specify:
# snapshot
# version_stamp
# source_subpath (seed)
