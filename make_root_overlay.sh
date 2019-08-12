#!/bin/bash -x

mkdir -p gitmodules
pushd gitmodules
git clone --depth 1 https://github.com/RPi-Distro/firmware.git
git clone https://github.com/RPi-Distro/firmware-nonfree.git
git clone https://github.com/RPi-Distro/bluez-firmware.git
git clone https://github.com/RPi-Distro/pi-bluetooth.git
popd

mkdir -p root_overlay/lib/{modules,firmware/brcm}
mkdir -p root_overlay/usr/bin
cp -f gitmodules/firmware-nonfree/brcm/brcmfmac434{30,55}* root_overlay/lib/firmware/brcm
cp -f gitmodules/bluez-firmware/broadcom/BCM434* root_overlay/lib/firmware
cp -Rf gitmodules/firmware/modules/*-v7+/ root_overlay/lib/modules/
cp -f gitmodules/pi-bluetooth/usr/bin/* root_overlay/usr/bin/

tar -C gitmodules/firmware/boot -cf boot.tar .
# add config.txt and cmdline.txt
tar -C boot_overlay -rf boot.tar ./config.txt ./cmdline.txt
BOOT_FILESIZE=$(($(stat --printf="%s" boot.tar)+0))
# TODO subst into partitions.json
echo $BOOT_FILESIZE > boot.tar.size
xz -T 0 boot.tar
