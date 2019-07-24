#!/bin/bash

# Global Variable
KEYBOARD='en'
EFI_MODE=false

# Color
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Shortcut command
alias echo='echo -e'

# BEGIN
echo "Arch install script"

# Load keyboard
echo "Available Keyboard: fr en ru"
read -p "Choose your keyboard layout: " KEYBOARD

loadkeys $KEYBOARD

if [ $? -eq 0 ]; then
    echo "${GREEN}Keyboard setup.${NC}"
else
    echo "${RED}Keyboard setup fail.${NC}"
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
if ping -q -c 1 -W 3 google.com >/dev/null; then
    echo "${GREEN}The network is up.${NC}"
else
    echo "${RED}The network is down.${NC}"
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

echo "${YELLOW}Time for you to partition your disk.${NC}"
# END
