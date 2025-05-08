#!/bin/bash

set -x -e

# install debootstrap
sudo dnf install -y debootstrap

# prepare template root filesystem
ROOTDIR=./root
CACHEDIR=$(realpath ./pkg-cache)
mkdir -p $CACHEDIR
sudo rm -rf $ROOTDIR
sudo debootstrap --cache-dir=$CACHEDIR noble $ROOTDIR https://mirrors.cloud.tencent.com/ubuntu/ 

# set root password
echo "set root password"
sudo systemd-nspawn -D ./root passwd

# copy overlays
sudo rsync -a overlays/ $ROOTDIR
