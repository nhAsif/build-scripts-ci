#!/bin/bash

export PATH=~/bin/:$PATH

cd ~/ &&\
git clone https://github.com/CyberJalagam/android_rom_building_scripts scripts && cd scripts && chmod +x build.sh && echo "1 13" | bash build.sh

mkdir -p ~/bin &&\
mkdir -p ~/android/lineage &&\
mkdir -p ~/android/lineage/.repo/local_manifests &&\

git config --global user.email "najmulhasan3609@gmail.com" &&\
git config --global user.name "nhAsif" &&\

cd ~/android/lineage &&\
repo init --depth=1 --no-repo-verify -u git://github.com/Evolution-X/manifest -b elle -g default,-mips,-darwin,-notdefault &&\
git clone https://github.com/nhAsif/local_manifest.git --depth 1 -b evo .repo/local_manifests &&\
repo sync -j$(nproc --all) -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune &&\
cd ~/android/lineage &&\
source build/envsetup.sh &&\
lunch evolution_rosy-userdebug &&\
croot &&\
mka evolution | tee logs.txt
