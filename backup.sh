#!/bin/bash
# Intro
# ------
echo "------"
echo "Welcome to version 0.1 of the Backup Script"
echo "------"
sleep 2
clear

read -p 'Username: ' uservar

echo "Hello $uservar what would you like to backup today?"
echo "------"
echo "[1] Pictures"
echo "[2] Documents"
echo "[3] Everything"
echo "------"
echo -n "Enter choice: "; read choice
case "$choice" in
1) cp -r /home/$uservar/Pictures/* /media/$uservar/ExtraDrive1/Backups/Pictures/
   ;;
2) cp -r /home/$uservar/Documents/* /media/$uservar/ExtraDrive1/Backups/Documents/
   ;;
3) cp -r /home/$uservar/Pictures/* /media/$uservar/ExtraDrive1/Backups/Pictures/ 
   cp -r /home/$uservar/Documents/* /media/$uservar/ExtraDrive1/Backups/Documents/
   ;;
esac
echo "Done backing up those dictories"
echo "Have a great day!"

