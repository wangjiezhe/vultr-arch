#!/bin/sh

mkfs.btrfs -m single -L arch -f /dev/vda2
mount -o compress=lzo /dev/vda2 /mnt

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
mount -o compress=lzo,subvol=@ /dev/vda2 /mnt

mkdir -p /mnt/{boot,home,srv,var/{log,cache/pacman/pkg,tmp}}
mount -o compress=lzo,subvol=@boot /dev/vda2 /mnt/boot
mount -o compress=lzo,subvol=@home /dev/vda2 /mnt/home
mount -o compress=lzo,subvol=@log /dev/vda2 /mnt/var/log
mount -o compress=lzo,subvol=@pkg /dev/vda2 /mnt/var/cache/pacman/pkg
mount -o compress=lzo,subvol=@srv /dev/vda2 /mnt/srv
mount -o compress=lzo,subvol=@tmp /dev/vda2 /mnt/var/tmp

pacstrap /mnt base base-devel snapper vim openssh linux linux-firmware grub btrfs-progs

genfstab -U /mnt >> /mnt/etc/fstab
