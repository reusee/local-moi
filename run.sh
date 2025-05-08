sudo systemd-nspawn \
  --directory=./root \
  --ephemeral \
  --boot \
  --private-network \
  --network-veth \
  --port=tcp:80:80 \
  --resolv-conf=copy-host \
  --timezone=copy \

