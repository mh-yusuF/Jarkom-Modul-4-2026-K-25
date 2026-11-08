#!/bin/bash
# Node Reika  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch6   (A11: 10.76.18.0/24)

ip link set eth0 up
ip addr replace 10.76.18.3/24 dev eth0

ip route replace default via 10.76.18.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
