#!/bin/bash
# Node Lain  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch13   (A25: 10.76.28.64/26)

ip link set eth0 up
ip addr replace 10.76.28.66/26 dev eth0

ip route replace default via 10.76.28.65
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
