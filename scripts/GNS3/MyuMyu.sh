#!/bin/bash
# Node MyuMyu  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch1   (A1: 10.76.20.0/25)

ip link set eth0 up
ip addr replace 10.76.20.3/25 dev eth0

ip route replace default via 10.76.20.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
