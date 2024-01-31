#!/bin/bash
# Fish install
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt update
sudo apt install fish

# AD Prepare

apt install fly-admin-ad-sssd-client

# Yandex Browser Install
apt install yandex-browser-stable

# xRDP Install
apt install xrdp

# Disk Mount

mkdir /mnt/network_disk
mount -o username=inform1 //law/base/Distrib /mnt/network_disk

# Kaspersky .deb Install

dpkg -i /mnt/network_disk/KESL11_11.3.0.7508\(ФСТЭК\)_643.46856491.00049-11/kesl/kesl_11.3.0-7508.cert_amd64.deb
wait
dpkg -i /mnt/network_disk/KESL11_11.3.0.7508\(ФСТЭК\)_643.46856491.00049-11/klnagent/klnagent64_14.0.0-4646_amd64.deb
wait

# Kaspersky Postinstall Scripts Running

/opt/kaspersky/kesl/bin/kesl-setup.pl
wait
/opt/kaspersky/klnagent64/lib/bin/setup/postinstall.pl
wait