#!/bin/bash
# Node Lin  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch3   (A4: 10.76.0.0/22)

ip link set eth0 up
ip addr replace 10.76.0.3/22 dev eth0

ip route replace default via 10.76.0.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
