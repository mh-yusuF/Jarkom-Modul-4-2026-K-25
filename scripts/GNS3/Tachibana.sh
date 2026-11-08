#!/bin/bash
# Node Tachibana  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Wired   (A14: 10.76.20.132/30)
#   eth1 -> Switch9   (A15: 10.76.24.0/23)
#   eth2 -> Deus   (A16: 10.76.26.0/30)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.20.134/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.24.1/23 dev eth1
ip link set eth2 up
ip addr replace 10.76.26.1/30 dev eth2

ip route replace default via 10.76.20.133
ip route replace 10.76.28.0/22 via 10.76.26.2

echo "== selesai =="
ip -br addr
ip route
