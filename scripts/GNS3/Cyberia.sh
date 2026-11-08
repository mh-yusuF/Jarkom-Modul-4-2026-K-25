#!/bin/bash
# Node Cyberia  ->  simpan sebagai /root/script.sh lalu jalankan: bash /root/script.sh
# Wiring (adapter -> tujuan):
#   eth0 -> NAT1   (DHCP dari NAT)
#   eth1 -> Wired   (A2: 10.76.20.144/30)
#   eth2 -> Switch1   (A1: 10.76.20.0/25)

sysctl -w net.ipv4.ip_forward=1

ip link set eth1 up
ip addr replace 10.76.20.145/30 dev eth1
ip link set eth2 up
ip addr replace 10.76.20.1/25 dev eth2

# eth0 ke NAT1: alamat didapat dari DHCP NAT GNS3 (192.168.122.0/24) + default route
ip link set eth0 up
if command -v dhclient >/dev/null 2>&1; then dhclient -v eth0
elif command -v udhcpc >/dev/null 2>&1; then udhcpc -i eth0 -n -q
else echo "[!] dhclient/udhcpc tidak ada, set eth0 manual"; fi

ip route replace 10.76.0.0/19 via 10.76.20.146

# NAT supaya seluruh 10.76.0.0/19 bisa keluar lewat eth0
command -v iptables >/dev/null 2>&1 || { apt-get update && apt-get install -y iptables; }
iptables -t nat -C POSTROUTING -s 10.76.0.0/19 -o eth0 -j MASQUERADE 2>/dev/null || \
  iptables -t nat -A POSTROUTING -s 10.76.0.0/19 -o eth0 -j MASQUERADE

echo "== selesai =="
ip -br addr
ip route
