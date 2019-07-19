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

# Replace configuration:
cp bash_aliases ~/.bash_aliases
cp $DISTRIB/bashrc ~/.bashrc
