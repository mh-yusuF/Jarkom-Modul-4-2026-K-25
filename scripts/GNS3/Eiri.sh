#!/bin/bash
# Node Eiri  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Knights   (A21: 10.76.28.128/29)

ip link set eth0 up
ip addr replace 10.76.28.130/29 dev eth0

ip route replace default via 10.76.28.129
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
