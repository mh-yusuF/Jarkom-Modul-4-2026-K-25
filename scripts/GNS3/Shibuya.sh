#!/bin/bash
# Node Shibuya  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Phantoma   (A24: 10.76.28.32/30)
#   eth1 -> Switch13   (A25: 10.76.28.64/26)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.28.34/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.28.65/26 dev eth1

ip route replace default via 10.76.28.33

echo "== selesai =="
ip -br addr
ip route
