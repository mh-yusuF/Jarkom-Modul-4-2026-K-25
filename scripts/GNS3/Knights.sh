#!/bin/bash
# Node Knights  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Protocol7   (A20: 10.76.29.64/30)
#   eth1 -> Eiri   (A21: 10.76.28.128/29)
#   eth2 -> Phantoma   (A22: 10.76.28.136/30)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.29.66/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.28.129/29 dev eth1
ip link set eth2 up
ip addr replace 10.76.28.137/30 dev eth2

ip route replace default via 10.76.29.65
ip route replace 10.76.28.0/25 via 10.76.28.138

echo "== selesai =="
ip -br addr
ip route
