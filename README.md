# Tibia-installer
Tibia installer for ubuntu 20.04 LTS. You can use for another distros, but take care with compatibility (like the gamemode or libpcre). See how to deal with it [here](#for-non-Ubuntu-20.04-users)

## What it does
This script downloads the tibia for linux, install in your system at `~/Games/Tibia` creating a launch `.desktop` file.

## What I need to run
- Ubuntu 20.04
- Gamemode library installed (just worry with this point if not using Ubuntu 20.04)
- wget library (probably you have it)
- unzip library (the script automatically installs it for you, no worries)

## How to use

First download the installer.sh
```bash
  wget https://raw.githubusercontent.com/hfabio/tibia-installer/master/installer.sh
```
Then give the permission
```bash
  sudo chmod +x installer.sh
```
And just run as user
```bash
  ./installer.sh
```
>**note: you can be asked to insert your OS password if you don't use `sudo` in this terminal session**

## For non-Ubuntu 20.04 users
If you're not using ubuntu 20.04 LTS consider to install:
### libpcre
```bash
sudo apt-get install libpcre16-3

sudo ln -s /usr/lib/x86_64-linux-gnu/libpcre16.so.3 /usr/lib/x86_64-linux-gnu/libpcre16.so.0
```
### gamemode
```bash
  sudo add-apt-repository ppa:samoilov-lex/gamemode
  sudo apt update && sudo apt install gamemode
```
> You can install or find more infos about gamemode here:
[Gamemode github](https://github.com/FeralInteractive/gamemode)

#### If you use gnome I strongly recommend to use [this extension](https://extensions.gnome.org/extension/1852/gamemode/) to see when the gamemode activate
If does not appear in your status area, open your `gnome tweaks`, go to Extensions and click at the settings in Gamemode row, click at `Always show the icon`