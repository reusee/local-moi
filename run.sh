#!/bin/bash

set -x -e

. config

# root dir
if [ -z "$1" ]; then
  DIR="./root-$(date -Isec)"
  DIRARGS="--template=./root --directory=$DIR"
else
  DIR="$1"
  DIRARGS="--directory=$DIR"
fi

# run
sudo systemd-nspawn \
  $DIRARGS \
  --boot \
  --overlay=$MO_DIR:/root/matrixone \
  --overlay=$MOI_DIR:/root/matrixflow \

