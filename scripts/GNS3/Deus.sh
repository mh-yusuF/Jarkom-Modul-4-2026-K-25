#!/bin/bash
# Node Deus  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Tachibana   (A16: 10.76.26.0/30)
#   eth1 -> Switch10   (A17: 10.76.30.0/25)
#   eth2 -> Protocol7   (A18: 10.76.30.128/30)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.26.2/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.30.1/25 dev eth1
ip link set eth2 up
ip addr replace 10.76.30.129/30 dev eth2

ip route replace default via 10.76.26.1
ip route replace 10.76.28.0/23 via 10.76.30.130

echo "== selesai =="
ip -br addr
ip route
