#!/bin/bash
# Node Akashic  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Schumann   (A7: 10.76.12.0/29)

ip link set eth0 up
ip addr replace 10.76.12.2/29 dev eth0

ip route replace default via 10.76.12.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
