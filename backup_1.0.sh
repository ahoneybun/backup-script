#!/bin/bash
# Intro
# ------
clear
echo "---------------------------------------------"
echo "Welcome to version 1.0 of the Backup Script"
echo "---------------------------------------------"
sleep 2
clear

# Setting the username for path logic
echo "---------------------------------"
echo "Setting username for path logic"
read -p 'Username: ' uservar
sleep 2
clear

echo "---------------------------"
echo "Mounting your other drive"
echo "---------------------------"
sudo mount /dev/sda1 /media/$uservar/Steam-Library
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
echo "[5] WIP Archive Method"
echo "---------------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) cp -ru /home/$uservar/Pictures/* /media/$uservar/Steam-Library/Backups/Pictures/
   ;;
2) cp -ru /home/$uservar/Documents/* /media/$uservar/Steam-Library/Backups/Documents/
   ;;
3) cp -ru /home/$uservar/Videos/* /media/$uservar/Steam-Library/Backups/Videos/
   ;;
4) cp -ru /home/$uservar/Pictures/* /media/$uservar/Steam-Library/Backups/Pictures/ 
   cp -ru /home/$uservar/Documents/* /media/$uservar/Steam-Library/Backups/Documents/
   cp -ru /home/$uservar/Videos/* /media/$uservar/Steam-Library/Backups/Videos
   cp -ru /home/$uservar/android-sdk-linux/* /media/$uservar/Steam-Library/Backups/android-sdk-linux/
   cp -ru /home/$uservar/.bashrc /media/$uservar/Steam-Library/Backups/
   scp /home/$uservar/.bashrc root@vault.ahoneybun.net:/root/Backup/
   cp -ru /home/$uservar/.ssh/id_rsa* /media/$uservar/Steam-Library/Backups/.ssh/
   cp -ru /home/$uservar/.config/i3 /media/$uservar/Steam-Library/Backups/.config/i3/
   cp -ru /home/$uservar/.config/i3status /media/$uservar/Steam-Library/Backups/.config/i3status/
   cp -ru /home/$uservar/.config/sway/* /media/$uservar/Steam-Library/Backups/.config/sway/
   ;;
5) tar -czvf Pictures.tar.gz /home/$uservar/Pictures/* 
   mv Pictures.tar.gz /media/$uservar/Steam-Library/Backups/
   tar -czvf Documents.tar.gz /home/$uservar/Documents/* 
   mv Documents.tar.gz /media/$uservar/Steam-Library/Backups/
   tar -czvf config-files.tar.gz /home/$uservar/.config/* 
   mv config-files.tar.gz /media/$uservar/Steam-Library/Backups/
esac
clear

# Exit script
echo "---------------------------------"
echo "Done backing up those dictories"
echo "Have a great day!"
echo "---------------------------------"
sleep 2
clear

