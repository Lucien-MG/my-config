#!/bin/bash
# This script allow to choose the i3 theme

C=0
THEMES=('simple-config' 'minimal')

for THEME in ${THEMES[@]}
do
    echo "${C}/ ${THEME}"
    C=$(($C+1))
done

read -p "Choose a theme: " ANSWER
THEME=${THEMES[$ANSWER]}

# Apply theme:
cp $THEME/i3/config ~/.config/i3/

if [ $THEME = "simple-config" ]
then 
        cp $THEME/i3status/config ~/.config/i3status/
else
        if [ ! -f ~.config/polybar ]; then
            mkdir ~/.config/polybar/
        fi
        cp $THEME/polybar/config ~/.config/polybar/config
        cp $THEME/compton.conf ~/.config/compton.conf
        cp $THEME/Xresources ~/.Xresources
fi
