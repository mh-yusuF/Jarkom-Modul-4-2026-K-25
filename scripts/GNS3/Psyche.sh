#!/bin/bash
# Node Psyche  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch2   (A3: 10.76.20.136/29)
#   eth1 -> Switch3   (A4: 10.76.0.0/22)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.20.138/29 dev eth0
ip link set eth1 up
ip addr replace 10.76.0.1/22 dev eth1

ip route replace default via 10.76.20.137

echo "== selesai =="
ip -br addr
ip route
