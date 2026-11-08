#!/bin/bash
# Node Omnipresence  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch5   (A9: 10.76.8.0/22)

ip link set eth0 up
ip addr replace 10.76.8.2/22 dev eth0

ip route replace default via 10.76.8.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
