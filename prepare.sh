set -x -e

# install debootstrap
sudo dnf install -y debootstrap

# prepare root filesystem
ROOTDIR=./root
CACHEDIR=$(realpath ./pkg-cache)
mkdir -p $CACHEDIR
sudo rm -rf $ROOTDIR
sudo debootstrap --cache-dir=$CACHEDIR noble $ROOTDIR https://mirrors.cloud.tencent.com/ubuntu/ 
