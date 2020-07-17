#!/bin/bash
DIRECTORY="/home/$USER/Games/"
DOWNLOADED_FILE=/tmp/tibia.tar.gz

if [[ $EUID -eq 0 ]]; then
  notify-send "Please, use this script as user"
else
  notify-send "Hello $USER, vamos instalar o tibia!"
  echo '|- first lets download the client'
  wget https://static.tibia.com/download/tibia.x64.tar.gz -O $DOWNLOADED_FILE &&
  echo "|- Download finished"
  echo "|- Creating folder for tibia if not exists in $DIRECTORY"

  if [ -d ${DIRECTORY} ];then
  echo "|- the directory $DIRECTORY already exists"
  else
    echo "|- Creating $DIRECTORY"
    mkdir $DIRECTORY
    echo "|- Directory created"
  fi
  tar -xvzf $DOWNLOADED_FILE -C $DIRECTORY
  echo "|- Downloading .desktop file"
  wget https://raw.githubusercontent.com/hfabio/tibia-installer/master/Tibia.desktop -O ./Tibia.desktop &&
  sed -i -e "s/user_name/${USER}/g" Tibia.desktop
  wget https://raw.githubusercontent.com/hfabio/tibia-installer/master/tibia.png -O ~/Games/Tibia/Tibia_icon.png &&
  clear
  echo "|- Now we need a root access to create the .desktop icon and do chmod for tibia"
  sudo mv ./Tibia.desktop /usr/share/applications/
  sudo chmod +x ~/Games/Tibia/start-tibia-launcher.sh
  echo "|- Opening tibia to install open map"
fi