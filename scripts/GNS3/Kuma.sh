#!/bin/bash
# Node Kuma  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch8   (A13: 10.76.16.0/24)

ip link set eth0 up
ip addr replace 10.76.16.4/24 dev eth0

ip route replace default via 10.76.16.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
