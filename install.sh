#! /bin/bash

#wget https://raw.githubusercontent.com/ 

rm /mnt/etc/nixos/configuration.nix

git clone http://github.com/knosence/nixos ~/.config/nixpkgs

mkdir /home/knosence/.config/alacritty/
ln ~/.config/nixpkgs/configuration.nix /etc/nixos/configuration.nix
ln ~/.config/nixpkgs/alacritty.yml ~/.config/alacritty/alacritty.yml

nixos-rebuild switch

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

home-manager switch

echo "     >>>  done "
