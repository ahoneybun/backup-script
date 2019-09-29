#!/bin/bash
# Intro
# ------
clear
echo "---------------------------------------------"
echo "Welcome to version 1.0 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

echo "---------------------------"
echo "Mounting your other drive"
echo "---------------------------"
sudo mount /dev/sda1 /media/$USER/Steam-Library
sleep 2
clear

# Selecting which dictories to backup
echo "-----------------------------------------------------------"
echo "Hello $USER what would you like to backup today?"
echo "-----------------------------------------------------------"
echo "[1] Pictures"
echo "[2] Documents"
echo "[3] Videos"
echo "[4] Everything"
echo "---------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) rsync -av --progress /home/$USER/Pictures/* /media/$USER/Steam-Library/Backups/Pictures/
   ;;
2) rsync -av --progress /home/$USER/Documents/* /media/$USER/Steam-Library/Backups/Documents/
   ;;
3) rsync -av --progress /home/$USER/Videos/* /media/$USER/Steam-Library/Backups/Videos/
   ;;
4) rsync -av --progress /home/$USER/Pictures/* /media/$USER/Steam-Library/Backups/Pictures/ 
   rsync -av --progress /home/$USER/Documents/* /media/$USER/Steam-Library/Backups/Documents/
   rsync -av --progress /home/$USER/Videos/* /media/$USER/Steam-Library/Backups/Videos
   rsync -av --progress /home/$USER/android-sdk-linux/* /media/$USER/Steam-Library/Backups/android-sdk-linux/
   rsync -av --progress /home/$USER/.bashrc /media/$USER/Steam-Library/Backups/
   scp /home/$USER/.bashrc root@vault.ahoneybun.net:/root/Backup/
   rsync -av --progress /home/$USER/.ssh/id_rsa* /media/$USER/Steam-Library/Backups/.ssh/
   rsync -av --progress /home/$USER/.config/i3 /media/$USER/Steam-Library/Backups/.config/i3/
   rsync -av --progress /home/$USER/.config/i3-regolith /media/$USER/Steam-Library/Backups/.config/i3-regolith/
   rsync -av --progress /home/$USER/.config/i3xrocks /media/$USER/Steam-Library/Backups/.config/i3xrocks/
   rsync -av --progress /home/$USER/.config/i3status /media/$USER/Steam-Library/Backups/.config/i3status/
   rsync -av --progress /home/$USER/.config/sway/* /media/$USER/Steam-Library/Backups/.config/sway/
esac

# Exit script
echo "---------------------------------"
echo "Done backing up those dictories"
echo "Have a great day!"
echo "---------------------------------"
sleep 2

