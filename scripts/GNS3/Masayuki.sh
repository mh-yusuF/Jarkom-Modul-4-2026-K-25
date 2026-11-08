#!/bin/bash
# Node Masayuki  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch4   (A5: 10.76.4.0/23)

ip link set eth0 up
ip addr replace 10.76.4.2/23 dev eth0

ip route replace default via 10.76.4.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf || true

echo "== selesai =="
ip -br addr
ip route
