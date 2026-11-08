#!/bin/bash
# Node Taro  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch7   (A12: 10.76.17.0/26)

ip link set eth0 up
ip addr replace 10.76.17.2/26 dev eth0

ip route replace default via 10.76.17.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
