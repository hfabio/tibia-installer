#!/bin/bash
DIRECTORY="/home/$USER/Games/"
MINIMAP_DIRECTORY="/home/$USER/.local/share/CipSoft GmbH/Tibia/packages/Tibia/"
DOWNLOADED_FILE=/tmp/tibia.tar.gz



if [[ $EUID -eq 0 ]]; then
  notify-send "Please, use this script as user, not as root!"
else
  notify-send "Hello $USER, vamos instalar o tibia!"
  echo "|- First of all lets check if you have unzip installed"
  sudo apt-get install unzip &&
  echo "|- Lets download the client"
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
  echo "|- Now we need will use a root access to create the .desktop icon and do chmod for tibia, you can be asked for a password:"
  sudo mv ./Tibia.desktop /usr/share/applications/
  sudo chmod +x ~/Games/Tibia/start-tibia-launcher.sh
  clear
  echo "|- Opening tibia to install open map"
  echo "|- Downloading minimap files"
  wget https://tibiamaps.io/downloads/minimap-with-markers /tmp/minimap-with-markers.zip
  if [ -d ${MINIMAP_DIRECTORY} ];then
    echo "|- the directory $MINIMAP_DIRECTORY already exists"
  else
    echo "|- Creating $MINIMAP_DIRECTORY"
    mkdir $MINIMAP_DIRECTORY
    echo "|- Minimap directory created"
  fi
  unzip /tmp/minimap-with-markers.zip -d $MINIMAP_DIRECTORY
  ~/Games/Tibia/start-tibia-launcher.sh
fi