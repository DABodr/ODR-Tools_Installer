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
sudo sudo chmod -R 777  /home/$USER/dab/config
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
if [ -f /etc/supervisor/conf.d/mux.conf ]
then
sudo rm /etc/supervisor/conf.d/enc-*.conf
sudo rm /etc/supervisor/conf.d/mux.conf
fi
sudo ln /home/$USER/dab/config/supervisor/*.conf /etc/supervisor/conf.d/
sudo supervisorctl reread 
sudo supervisorctl update
echo
echo "Ouverture de la page http://localhost:8001 dans votre navigateur "
echo " utilisateur: odr  mot de passe: odr"
echo " ctrl+c pour quitter"
echo " pensez a ajouer cette page a vos favoris"
sensible-browser http://localhost:8001 &
echo 
echo
echo -e "[$GREEN OK $NORMAL]"
echo
fi
