#!/bin/bash
# Node Accela  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Schumann   (A8: 10.76.12.8/30)
#   eth1 -> Switch5   (A9: 10.76.8.0/22)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.12.10/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.8.1/22 dev eth1

ip route replace default via 10.76.12.9

echo "== selesai =="
ip -br addr
ip route
