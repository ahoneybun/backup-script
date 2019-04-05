#!/bin/bash
# Intro
# ------
clear
echo "---------------------------------------------"
echo "Welcome to version 0.5 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

# Setting the username for path logic
echo "---------------------------------"
echo "Setting username for path logic"
read -p 'Username: ' uservar
sleep 2
clear

# Setting location
echo "-----------------------------------"
echo "Setting location"
echo "home and media are the most common"
read -p 'Mount: ' mountvar
sleep 2
clear

# Testing for automounting
#if [ findmnt --fstab --evaluate | grep ExtraDrive1 = "ExtraDrive1" ]; then
#echo "Yes"
#fi

echo "---------------------------"
echo "Mounting your ExtraDrive1"
echo "---------------------------"
sudo mount /dev/sda1 /media/$uservar/ExtraDrive1
sleep 2
clear

# Selecting which dictories to backup
echo "-----------------------------------------------------------"
echo "Hello $uservar what would you like to backup today?"
echo "-----------------------------------------------------------"
echo "[1] Pictures"
echo "[2] Documents"
echo "[3] Videos"
echo "[4] Everything"
echo "---------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) cp -ru /home/$uservar/Pictures/* /$mountvar/$uservar/ExtraDrive1/Backups/Pictures/
   ;;
2) cp -ru /home/$uservar/Documents/* /$mountvar/$uservar/ExtraDrive1/Backups/Documents/
   ;;
3) cp -ru /home/$uservar/Videos/* /$mountvar/$uservar/ExtraDrive1/Backups/Videos/
   ;;
4) cp -ru /home/$uservar/Pictures/* /$mountvar/$uservar/ExtraDrive1/Backups/Pictures/ 
   cp -ru /home/$uservar/Documents/* /$mountvar/$uservar/ExtraDrive1/Backups/Documents/
   cp -ru /home/$uservar/Videos/* /$mountvar/$uservar/ExtraDrive1/Backups/Videos
   cp -ru /home/$uservar/.ssh/id_rsa* /$mountvar/$uservar/ExtraDrive1/Backups/.ssh/
   cp -ru /home/$uservar/.config/i3 /$mountvar/$uservar/ExtraDrive1/Backups/.config/i3/
   cp -ru /home/$uservar/.config/i3status /$mountvar/$uservar/ExtraDrive1/Backups/.config/i3status/
   cp -ru /home/$uservar/.config/sway/* /$mountvar/$uservar/ExtraDrive1/Backups/.config/sway/
   ;;
esac
clear

# Exit script
echo "---------------------------------"
echo "Done backing up those dictories"
echo "Have a great day!"
echo "---------------------------------"
sleep 2
clear

