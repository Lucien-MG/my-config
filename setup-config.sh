#!/bin/bash

# Get absolute path:
M_SCRIPT_PATH=$(pwd)

# Color:
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# This array contain all the config file that are in the git:
M_CONF_LIST=('vim' 'bash')

echo "This script will setup the configuration files for you.\n"
echo -e "${RED}Actual configuration files will be overwriten.${NC}"

for M_CONF in ${M_CONF_LIST[@]}
do
	read -p "Setup $M_CONF config ? [Y/n]: " M_ANSWER
	if [[ $M_ANSWER =~ ^[Yy]$ ]]
	then
        	cd $M_SCRIPT_PATH/$M_CONF

		    source $M_CONF.sh
        	echo -e "${GREEN}$M_CONF configuration is setup.${NC}"

		    cd $M_SCRIPT_PATH
	fi
done 
