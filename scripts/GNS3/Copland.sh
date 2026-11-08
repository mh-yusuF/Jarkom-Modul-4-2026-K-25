#!/bin/bash
# Node Copland  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Switch2   (A3: 10.76.20.136/29)
#   eth1 -> Switch4   (A5: 10.76.4.0/23)
#   eth2 -> Juri   (A6: 10.76.6.0/26)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.20.139/29 dev eth0
ip link set eth1 up
ip addr replace 10.76.4.1/23 dev eth1
ip link set eth2 up
ip addr replace 10.76.6.1/26 dev eth2

ip route replace default via 10.76.20.137

echo "== selesai =="
ip -br addr
ip route
