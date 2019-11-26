#!/bin/bash
# Dead simple backup script written in Bash 
# By Aaron Honeycutt
---

clear
echo "---------------------------------------------"
echo "Welcome to version 1.0 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

# Selecting which dictories to backup
echo "-----------------------------------------------------------"
echo "Hello $USER how would you like to backup today?"
echo "-----------------------------------------------------------"
echo "[1] rsync Method"
echo "-------------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) rsync -av --progress ~/Pictures/ /media/$USER/Backup/Pictures/
   rsync -av --progress ~/Documents/ /media/$USER/Backup/Documents/
   rsync -av --progress ~/.config/ /media/$USER/Backup/.config/
   rsync -av --progress ~/.bashrc /media/$USER/Backup/
   rsync -av --progress ~/.ssh/id_rsa* /media/$USER/Backup/.ssh/

   scp ~/.ssh/id_rsa* root@vault.ahoneybun.net:/root/Backups/.ssh/
   scp ~/.bashrc root@vault.ahoneybun.net:/root/Backups/
esac

# Exit script
echo "---------------------------------"
echo "Done backing up those directories"
echo "and files"
echo "Have a great day!"
echo "---------------------------------"
sleep 2
