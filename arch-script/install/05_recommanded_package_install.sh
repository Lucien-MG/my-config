#!/bin/bash

alias install="pacman -Syu"

NETWORK_P="networkmanager"
SYSTEM_P="udev acpid lsb-release"
SYSTEMADMIN_P="sudo syslog-ng mc mtools dosfstools exfat_utils git"
COMPTOOLS_P="zip unzip p7zip"
SOUND_P="alsa-utils"
FOOMATIC_P="foomatic-{db,db-ppds,db-gutenprint-ppds,db-nonfree,db-nonfree-ppds}
gutenprint"
MULTIMEDIA_P="gst-plugins-{base,good,bad,ugly} gst-libav"
VIM_P="vim"

read -p "Install and setup network manager ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $NETWORK_P
    systemctl enable NetworkManager
fi

read -p "Install system utils ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $SYSTEM_P
fi

read -p "Install system admin utils ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $SYSTEMADMIN_P
fi

read -p "Install compression tools ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $COMPTOOLS_P
fi

read -p "Install sound manager ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $SOUND_P
    alsamixer
    alsactl store
fi

read -p "Install printer drivers ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $FOOMATIC_P
fi

read -p "Install multimedia libs ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $COMPTOOLS_P
fi

read -p "Install vim ?" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $VIM_P 
fi
