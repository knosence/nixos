
#!/bin/bash

echo ">>> PARTITIONING DRIVES"
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -16GiB
parted /dev/sda -- mkpart primary linux-swap -16GiB 100%
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
/dev/sda -- set 3 esp on

echo ">>> FORMATING DRIVES"
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3

echo ">>> MOUNTING DRIVES"
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2
nixos-generate-config --root /mnt

read -p ">>> OPENING CONFIG IN VIM"

vim /mnt/etc/nixos/configuration.nix

read -p ">>> SETUP IS COMPLETE, HIT ENTER TO CONTINUE"


