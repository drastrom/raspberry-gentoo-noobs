#!/bin/bash -x

mkdir -p modules
pushd modules
git clone --depth 1 https://github.com/RPi-Distro/firmware.git
git clone https://github.com/RPi-Distro/firmware-nonfree.git
git clone https://github.com/RPi-Distro/bluez-firmware.git
git clone https://github.com/RPi-Distro/pi-bluetooth.git
popd

mkdir -p root_overlay/lib/{modules,firmware/brcm}
mkdir -p root_overlay/usr/bin
cp -f modules/firmware-nonfree/brcm/brcmfmac434* root_overlay/lib/firmware/brcm
cp -f modules/bluez-firmware/broadcom/BCM434* root_overlay/lib/firmware
cp -Rf modules/firmware/modules/*-v7+/ root_overlay/lib/modules/
cp -f modules/pi-bluetooth/usr/bin/* root_overlay/usr/bin/

# TODO add config.txt and cmdline.txt
tar -C modules/firmware/boot -Jcf boot.tar.xz .
