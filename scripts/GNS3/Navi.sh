#!/bin/bash
# Node Navi  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Wired   (A10: 10.76.20.128/30)
#   eth1 -> Switch6   (A11: 10.76.18.0/24)
#   eth2 -> Switch7   (A12: 10.76.17.0/26)
#   eth3 -> Switch8   (A13: 10.76.16.0/24)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.20.130/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.18.1/24 dev eth1
ip link set eth2 up
ip addr replace 10.76.17.1/26 dev eth2
ip link set eth3 up
ip addr replace 10.76.16.1/24 dev eth3

ip route replace default via 10.76.20.129

echo "== selesai =="
ip -br addr
ip route
