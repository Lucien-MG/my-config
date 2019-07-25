#!/bin/bash

alias install="pacman -Syu"

XORG_P="xorg-{server,xinit,apps}"
INPUT_P="xf86-input-{mouse,keyboard}"
USER_P="xdg-user-dirs"
FONT_P="ttf-{bitstream-vera,liberation,freefont,dejavu} freetype2"
VIRTUALBOX_P="xf86-video-vesa virtualbox-guest-utils"

cinnamon="cinnamon lightdm-gtk-greeter-settings"
gnome=""
xfce=""

DESK_ENVS_NAME=('gnome' 'cinnamon' 'xfce')
DESK_ENVS=($gnome $cinnamon $xfce)

read -p "Do you want a graphical interface ? [Y/n]" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $XORG_P $INPUT_P $USER_P $FONT_P
else
    exit
fi

# NEED GRPHICAL DRIVER !!!

read -p "Are you in a virtual machine ? [Y/n]" ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    install $VIRTUALBOX_P
    systemctl enable vboxservice
fi

COUNT=0

for DESK_ENV in ${DESK_ENV_NAME[@]}
do
    echo "${COUNT}/ ${DESK_ENV}"
    COUNT=$(($COUNT+1))
done

read -p "Choose your desktop environment: " NB_DESK

DESK=${DESK_ENVS[$NB_DESK]}
install DESK

# Set fr keyboard for x11
localectl set-x11-keymap fr
