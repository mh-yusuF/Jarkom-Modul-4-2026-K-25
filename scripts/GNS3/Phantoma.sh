#!/bin/bash
# Node Phantoma  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Knights   (A22: 10.76.28.136/30)
#   eth1 -> Switch12   (A23: 10.76.28.0/27)
#   eth2 -> Shibuya   (A24: 10.76.28.32/30)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.28.138/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.28.1/27 dev eth1
ip link set eth2 up
ip addr replace 10.76.28.33/30 dev eth2

ip route replace default via 10.76.28.137
ip route replace 10.76.28.64/26 via 10.76.28.34

echo "== selesai =="
ip -br addr
ip route
