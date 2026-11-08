#!/bin/bash
# Node Lilith  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch10   (A17: 10.76.30.0/25)

ip link set eth0 up
ip addr replace 10.76.30.2/25 dev eth0

ip route replace default via 10.76.30.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
