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
