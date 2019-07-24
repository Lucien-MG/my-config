#!/bin/bash

# Global Variable
KEYBOARD='en'
EFI_MODE=false

# Shortcut command
alias echo='echo -e'

# BEGIN
echo "### Setup Archlinux install script ###"

# Load keyboard
echo "Available Keyboard:"
ls /usr/share/kdb/locale
read -p "Choose your keyboard layout: " KEYBOARD

loadkeys $KEYBOARD

if [ $? -eq 0 ]; then
    echo "Keyboard setup."
else
    echo "Keyboard setup fail."
fi

# Check if the machine is in EFI or CSM mode
# Folder efi exit only in mode EFI
if [ -d "/sys/firmware/efi/efivars" ]; then
    echo "UEFI mode is enabled."
    EFI_MODE=true
else
    echo "CSM mode is enabled."
    EFI_MODE=false
fi

# Check if network is up
# ping -> -c nb = the number of request to send
#      -> -q = quiet output
#      -> -W nb = time to wait for a response
echo "Checking network..."

if ping -q -c 1 -W 3 google.com >/dev/null; then
    echo "The network is up."
else
    echo "The network is down."
    read -p "Do you want to connect to through wi-fi ? [Y/n]: " DIALOG_ANSWER
    if [[ $DIALOG_ANSWER =~ ^[Yy]$ ]]; then
        wifi-menu
    else
        echo "Impossible to do the installation without internet."
        echo "EXIT"
        exit
    fi
fi

# Update the system clock 
timedatectl set-ntp true

echo "Time for you to partition your disk."

echo "### End setup Archlinux script ###"
# END
