#!/usr/bin/bash

# NTS instead of NTP
sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/chrony.conf -o /etc/chrony.conf

# randomize MAC address & disable static hostname

sudo bash -c 'cat > /etc/NetworkManager/conf.d/00-macrandomize.conf' <<-'EOF'
[main]
hostname-mode=none

[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
EOF

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

#for iwd
sudo bash -c 'cat > /etc/iwd/main.conf'  <<-'EOF'

[General]
AddressRandomization=once
AddressRandomizationRange=nic

#for wpa

sudo bash -c 'cat > /etc/wpa_supplicant/wpa_supplicant-wlan0.conf <<-'EOF'
mac_addr=1
preassoc_mac_addr=1
gas_rand_mac_addr=1
