#!/bin/bash

# Minimal Installation
# Install arch base
# Add ntfs-3g and os-prober to detect windows in dual-boot case
# Add bash completion
pacstrap /mnt base base-devel grub os-prober ntfs-3g bash-completion

if [ $? -eq 0 ]; then
    echo "Arch linux base installed"
else
    echo "Installation failed."
fi

genfstab -U /mnt >> /mnt/etc/fstab

cp config_install.sh /mnt/

# Change root into the new system:
arch-chroot /mnt ./config_install.sh
