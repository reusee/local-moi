sudo systemd-nspawn \
  --template=./root \
  --directory=root-$(date -Isec) \
  --boot \
  --private-network \
  --network-veth \
  --port=tcp:80:80 \
  --resolv-conf=copy-host \
  --timezone=copy \

