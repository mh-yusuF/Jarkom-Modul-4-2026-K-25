#!/bin/bash
# Node Wired  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Cyberia   (A2: 10.76.20.144/30)
#   eth1 -> Switch2   (A3: 10.76.20.136/29)
#   eth2 -> Navi   (A10: 10.76.20.128/30)
#   eth3 -> Tachibana   (A14: 10.76.20.132/30)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.20.146/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.20.137/29 dev eth1
ip link set eth2 up
ip addr replace 10.76.20.129/30 dev eth2
ip link set eth3 up
ip addr replace 10.76.20.133/30 dev eth3

ip route replace default via 10.76.20.145
ip route replace 10.76.0.0/22 via 10.76.20.138
ip route replace 10.76.4.0/22 via 10.76.20.139
ip route replace 10.76.8.0/21 via 10.76.20.140
ip route replace 10.76.16.0/22 via 10.76.20.130
ip route replace 10.76.24.0/21 via 10.76.20.134

echo "== selesai =="
ip -br addr
ip route
