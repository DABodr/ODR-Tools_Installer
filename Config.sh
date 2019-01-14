#!/bin/bash

NORMAL="\e[0m"
RED="\e[91m"
clear
which sudo
if [ "$?" == "0" ]
then
    echo "Press Ctrl-C to abort installation"
    echo "or Enter to proceed"

    read
else
    echo -e $RED
    echo -e "Please install sudo first $NORMAL using"
    echo " apt-get -y install sudo"
    exit 1
fi

set -e

echo "Modification du fichier de configuration Supervisor"
if [ "$?" == "0" ]
then
    echo "Press Ctrl-C to abort Supervisor Configuration"
    echo "or Enter to proceed"

    read
sudo /etc/init.d/supervisor stop
sudo cp -v supervisord.conf /etc/supervisor/supervisord.conf
echo -e "[$GREENOK$NORMAL]"
echo
echo " Copie des fichiers de configuration"
sudo cp -R config /home/$USER/dab/
echo
echo -e "[$GREENOK$NORMAL]"
echo
echo "Redemarrage de Supervisor"
sudo /etc/init.d/supervisor start
echo
echo -e "[$GREENOK$NORMAL]"
echo
echo "Coincoin"
fi
