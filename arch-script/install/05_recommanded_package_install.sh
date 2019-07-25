#!/bin/bash

NETWORK_P="networkmanager"
SYSTEM_P="udev acpid lsb-release"
SYSTEMADMIN_P="sudo syslog-ng mc mtools dosfstools exfat_utils git"
COMPTOOLS_P="zip unzip p7zip"
SOUND_P="alsa-utils"
FOOMATIC_P="foomatic-{db,db-ppds,db-gutenprint-ppds,db-nonfree,db-nonfree-ppds}
gutenprint"
MULTIMEDIA_P="gst-plugins-{base,good,bad,ugly} gst-libav"
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

read -p "Install system admin utils ? [Y/n]: "  ANSWER

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
    pacman -Syu $FOOMATIC_P
fi

read -p "Install multimedia libs ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $COMPTOOLS_P
fi

read -p "Install vim ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    pacman -Syu $VIM_P 
fi
