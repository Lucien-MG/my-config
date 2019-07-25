#!/bin/bash

if [ -f "./03_base_install.sh" ]; then                                          
    echo "arch-chroot"                                                          
    cp $SCRIPT_PATH/$0 /mnt/                                                    
    arch-chroot /mnt ./$0                                                       
    exit                                                                        
fi

NETWORK_P="networkmanager"
SYSTEM_P="udev acpid lsb-release"
SYSTEMADMIN_P="syslog-ng mc mtools dosfstools exfat_utils git"
COMPTOOLS_P="zip unzip p7zip"
SOUND_P="alsa-utils"
FOOMATIC_P="foomatic-db foomatic-db-ppds foomatic-db-gutenprint-ppds"
FOOMATIC_P2="foomatic-db-nonfree foomatic-db-nonfree-ppds"
MULTIMEDIA_P="gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav"
MULTIMEDIA_P2="gst-plugins-ugly"
VIM_P="vim"

read -p "Install and setup network manager ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $NETWORK_P
    systemctl enable NetworkManager
fi

read -p "Install system utils ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $SYSTEM_P
fi

read -p "Install system admin utils ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $SYSTEMADMIN_P
fi

read -p "Install compression tools ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $COMPTOOLS_P
fi

read -p "Install sound manager ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $SOUND_P
    alsamixer
    alsactl store
fi

read -p "Install printer drivers ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $FOOMATIC_P $FOOMATIC_p2
fi

read -p "Install multimedia libs ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $MULTIMEDIA_P $MULTIMEDIA_P2
fi

read -p "Install vim ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $VIM_P 
fi
