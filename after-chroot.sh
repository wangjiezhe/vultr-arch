#!/bin/sh

# Time
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# Locale
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Network
echo "ebm" > /etc/hostname
echo "127.0.0.1  localhost\n::1  localhost" >> /etc/hosts
sed -i -e 's/#Port 22/Port 2222/' -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
echo "[Match]\nName=*\n\n[Network]\nDHCP=yes" > /etc/systemd/network/80-dhcp.network
systemctl enable systemd-networkd
systemctl enable systemd-resolved

# Initramfs
sed -i 's/MOUDLE=()/MOUDLE=(btrfs)/' /etc/mkinitcpio.conf
mkinitcpio -p linux
