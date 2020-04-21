#!/bin/sh

mkfs.btrfs -A 10240 -m single -L arch /dev/vda
mount -o compress=lzo /dev/vda /mnt

cd /mnt
btrfs su cr @
btrfs su cr @boot
btrfs su cr @home
btrfs su cr @log
btrfs su cr @pkg
btrfs su cr @srv
btrfs su cr @tmp

cd /
umount /mnt
mount -o compress=lzo,subvol=@ /dev/vda /mnt

mkdir -p /mnt/{boot,home,srv,var/{log,cache/pacman/pkg,tmp}}
mount -o compress=lzo,subvol=@boot /dev/vda /mnt/boot
mount -o compress=lzo,subvol=@home /dev/vda /mnt/home
mount -o compress=lzo,subvol=@log /dev/vda /mnt/var/log
mount -o compress=lzo,subvol=@pkg /dev/vda /mnt/var/cache/pacman/pkg
mount -o compress=lzo,subvol=@srv /dev/vda /mnt/srv
mount -o compress=lzo,subvol=@tmp /dev/vda /mnt/var/tmp

pacstrap /mnt base base-devel snapper vim openssh linux linux-firmware grub btrfs-progs

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

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
