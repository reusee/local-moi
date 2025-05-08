#!/bin/bash

set -x -e

if [ -z "$1" ]; then
  DIR="--template=./root --directory=root-$(date -Isec)"
else
  DIR="--directory=$1"
fi

sudo systemd-nspawn \
  $DIR \
  --boot \
