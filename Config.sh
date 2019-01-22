#!/bin/bash

NORMAL="\e[0m"
RED="\e[91m"
GREEN="\e[92m"

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

echo "Modification des fichiers de configuration Supervisor"
if [ "$?" == "0" ]
then
    echo "Press Ctrl-C to abort Supervisor Configuration"
    echo "or Enter to proceed"

    read
sudo /etc/init.d/supervisor stop
sudo cp -v supervisord.conf /etc/supervisor/supervisord.conf
echo -e "[$GREEN OK $NORMAL]"
echo

echo " Copie des fichiers de configuration"
sudo cp -R config /home/$USER/dab/
echo
echo -e "[$GREEN OK $NORMAL]"
echo

echo "Redemarrage de Supervisor"
sudo /etc/init.d/supervisor start
echo
echo -e "[$GREEN OK $NORMAL]"
echo

echo "Modification de la variable USER des fichiers de configuration"
for file in /home/$USER/dab/config/supervisor/*.conf
do
  echo "Traitement de $file ..."
  sudo sed -i -e "s/azerty/$USER/g" "$file"
done 
echo -e "[$GREEN OK $NORMAL]"

echo "Creation des liens symboliques"
sudo ln /home/$USER/dab/config/supervisor/*.conf /etc/supervisor/conf.d/
sudo ln /home/$user/dab/config/*.conf /etc/supervisor/conf.d/
sudo supervisorctl reread 
sudo sudo supervisorctl update
echo
echo -e "[$GREEN OK $NORMAL]"
echo
fi
