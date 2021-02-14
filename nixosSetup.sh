
#!/bin/bash

read -p "Enter the Dirve (example /dev/sda:  " drive

echo ">>> PARTITIONING DRIVES"
parted $drive -- mklabel gpt
parted $drive -- mkpart primary 512MiB -16GiB
parted $drive -- mkpart primary linux-swap -16GiB 100%
parted $drive -- mkpart ESP fat32 1MiB 512MiB
parted $drive -- set 3 esp on

echo ">>> FORMATING DRIVES"
mkfs.ext4 -L nixos ${drive}1
mkswap -L swap ${drive}2
mkfs.fat -F 32 -n boot ${drive}3

echo ">>> MOUNTING DRIVES"
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon ${drive}2
nixos-generate-config --root /mnt

rm /mnt/etc/nixos/configuration.nix
cp /home/nixos/nixos/configuration.nix /mnt/etc/nixos/configuration.nix

read -p ">>> OPENING CONFIG IN VIM"
vim /mnt/etc/nixos/configuration.nix

echo "make sure boot is flaged as such"
read -p ">>> SETUP IS COMPLETE, HIT ENTER TO CONTINUE"

nixos-install
