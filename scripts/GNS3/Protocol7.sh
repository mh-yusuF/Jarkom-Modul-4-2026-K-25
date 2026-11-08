#!/bin/bash
# Node Protocol7  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> Deus   (A18: 10.76.30.128/30)
#   eth1 -> Switch11   (A19: 10.76.29.0/26)
#   eth2 -> Knights   (A20: 10.76.29.64/30)

sysctl -w net.ipv4.ip_forward=1

ip link set eth0 up
ip addr replace 10.76.30.130/30 dev eth0
ip link set eth1 up
ip addr replace 10.76.29.1/26 dev eth1
ip link set eth2 up
ip addr replace 10.76.29.65/30 dev eth2

ip route replace default via 10.76.30.129
ip route replace 10.76.28.0/24 via 10.76.29.66

echo "== selesai =="
ip -br addr
ip route
