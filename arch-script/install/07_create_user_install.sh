#!/bin/boot

if [ -f "./03_base_install.sh" ]; then
    echo "arch-chroot"
    cp $SCRIPT_PATH/$0 /mnt/
    arch-chroot /mnt ./$0
    exit
fi

# Create a new user
read -p "Do you want to create a new user ? [Y/n]: " ANSWER

if [[ $ANSWER =~ ^[Yy]$ ]]; then
    read -p "Full name: " FULL_NAME
    read -p "User name: " USER_NAME
    read -p "Give to this user sudo right ? [Y/n]: " ANSWER_S
    read -p "Which shell do you want to use ?: " ANSWER_SHELL

    if [[ $ANSWER =~ ^[Yy]$ ]]; then
        useradd -m -g wheel -c "$FULL_NAME" -s /bin/$ANSWER_SHELL
    else
        useradd -m -c "$FULL_NAME" -s /bin/$ANSWER_SHELL
    fi

    echo "Give a password to ${USER_NAME}"
    passwd $USER_NAME
fi
