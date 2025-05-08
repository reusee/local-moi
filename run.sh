#!/bin/bash

set -x -e

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

