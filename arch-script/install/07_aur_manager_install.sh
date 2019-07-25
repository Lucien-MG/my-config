#!/bin/bash

WRAPPERS=('trizen' 'pacaur' 'yay')
trizen="https://aur.archlinux.org/trizen.git"
pacaur="https://aur.archlinux.org/pacaur.giti"
yay="https://aur.archlinux.org/yay.git"

read -p "Do you want to install a pacman wrapper ? [Y/n]" ANSWER

if [[ ANSWER =~ ^[Yy]$ ]]; then
    
    git --version
    if [ $? != 0]; then
        echo "Git must be install to perform this action."
        exit
    fi

    COUNT=0

    for WRAP in ${WRAPPERS[@]}
    do
        echo "${COUNT}/ ${WRAP}"
        COUNT=$(($COUNT+1))
    done

    read -p "Choose a pacman wrapper: " NB_WRAPPER

    WRAPPER=$WRAPPERS[$NB_WRAPPER]
    git clone https://aur.archlinux.org/$WRAPPER ~/

    $WRAPPER/makepkg -si
fi
