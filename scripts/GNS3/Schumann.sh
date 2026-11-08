#!/bin/bash
# Node Schumann  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch2   (A3: 10.76.20.136/29)
#   eth1 -> Akashic   (A7: 10.76.12.0/29)
#   eth2 -> Accela   (A8: 10.76.12.8/30)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.20.140/29 dev eth0
ip link set eth1 up
ip addr replace 10.76.12.1/29 dev eth1
ip link set eth2 up
ip addr replace 10.76.12.9/30 dev eth2

ip route replace default via 10.76.20.137
ip route replace 10.76.8.0/22 via 10.76.12.10

echo "== selesai =="
ip -br addr
ip route
