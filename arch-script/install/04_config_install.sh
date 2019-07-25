#!/bin/bash

SCRIPT_PATH=$(pwd)

echo "### Begin configuration Archlinux install script ###"

if [ -f "./03_base_install.sh" ]; then
    echo "Re-run"
    cp $SCRIPT_PATH /mnt/
    arch-chroot /mnt ./04_config_install.sh
    exit
fi

# The user indicate his time zone
echo "Configuration of your time zone"

ls /usr/share/zoneinfo/
read -p "Choose a region: " REGION

ls /usr/share/zoneinfo/$REGION/
read -p "Choose a city: " CITY

# The time zone is linked in /etc/localtime
# 
echo "Generate time zone config ..."

ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime
hwclock --systohc

echo "Time zone setup."

echo "Configuration of your localisation"
echo "(Choose your language and keyboard)"

LANG=en_US.UTF-8 >> /etc/locale.conf
KEYMAP=fr >> /etc/vconsole.conf

# The user give some network configuration
echo "Network configuration"

read -p "Choose a host name for your machine: " HOSTNAME
mkdir /etc/$HOSTNAME

echo "127.0.0.1    localhost" >> /etc/hosts

echo "Generating initramfs..."

mkinitcpio -p linux

echo "Grub install"

grub-install /dev/sda

echo "Grub configuration"

os-prober
grub-mkconfig -o /boot/grub/grub.cfg

echo "Give a root password:"
passwd

# Create a new user
read -p "Do you want to create a new user ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    read -p "Full name: " FULL_NAME
    read -p "User name: " USER_NAME
    read -p "Give to this user sudo right ? [Y/n]: " ANSWER_S
    read -p "Which shell do you want to use ?: " ANSWER_SHELL

    if [[ $ANSWER =~ ^[Yy]$ ]]; then
        useradd -m -g wheel -c "${FULL_NAME}" -s /bin/$ANSWER_SHELL
    else
        useradd -m -c "${FULL_NAME}" -s /bin/$ANSWER_SHELL
    fi

    echo "Give a password to ${USER_NAME}"
    passwd $USER_NAME
fi

echo "### End configuration Arch linx install script ###"

SCRIPT_PATH=$(pwd)
echo $SCRIPT_PATH

rm $SCRIPT_PATH/04_config_install.sh
