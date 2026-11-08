#!/bin/bash
# Node Semi  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch12   (A23: 10.76.28.0/27)

ip link set eth0 up
ip addr replace 10.76.28.2/27 dev eth0

ip route replace default via 10.76.28.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
