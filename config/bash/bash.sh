# Bash config setup script

# Kernel release:
KERNEL=$(uname -r)

# Choose the write conf:
if [[ $KERNEL = *ARCH ]]
then
    DISTRIB=arch
else
    DISTRIB=debian
fi

# Choose color preferences:
echo "Choose ls color preferences: "
ls ls_colors

read -p "Choice: " COLOR

# Replace configuration:
cp bash_aliases ~/.bash_aliases
cp $DISTRIB/bashrc ~/.bashrc
