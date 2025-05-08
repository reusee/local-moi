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
  --private-network \
  --network-veth \
  --port=tcp:80:80 \
  --resolv-conf=copy-host \
  --timezone=copy \

