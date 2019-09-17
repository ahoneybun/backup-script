#!/bin/bash
# Intro
# ------
clear
echo "---------------------------------------------"
echo "Welcome to version 0.1 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

# Selecting which dictories to backup
echo "-----------------------------------------------------------"
echo "Hello $USER what would you like to backup today?"
echo "-----------------------------------------------------------"
echo "[1] Pictures"
echo "[2] Documents"
echo "[3] Everything"
echo "---------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) cp -ru /home/$USER/Pictures/* /media/$USER/Backup/Pictures/
   ;;
2) cp -ru /home/$USER/Documents/* /media/$USER/Backup/Documents/
   ;;
3) cp -ru /home/$USER/Pictures/* /media/$USER/Backup/Pictures/ 
   cp -ru /home/$USER/Documents/* /media/$USER/Backup/Documents/
   cp -ru /home/$USER/.ssh/id_rsa* /media/$USER/Backup/.ssh/
   ;;
esac

# Exit script
echo "---------------------------------"
echo "Done backing up those dictories"
echo "Have a great day!"
echo "---------------------------------"
sleep 2

