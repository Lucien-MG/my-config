#!/bin/bash

echo "### Configuration Archlinux install script ###"

echo "Configuration of your time zone"

ls /usr/share/zoneinfo/
read -p "Choose a region: " REGION

ls /usr/share/zoneinfo/$REGION/
read -p "Choose a city: " CITY

echo "Generate time zone config ..."

ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime
hwclock --systohc

echo "Time zone setup."

echo "Configguration of your localisation"
echo "(Choose your language and keyboard)"

LANG=en_US.UTF-8 >> /etc/locale.conf
KEYMAP=fr >> /etc/vconsole.conf

echo "Network configuration"

read -p "Choose a host name for your machine: " HOSTNAME
mkdir /etc/$HOSTNAME

127.0.0.1   localhost >> /etc/hosts

echo "Generating initramfs..."

mkinitcpio -p linux

echo "Grub configuration"

os-prober
grub-mkconfig -o /boot/grub/grub.cfg

echo "Grub install"

grub-install

echo "Give a root password:"
passwd

echo "### END ###"

