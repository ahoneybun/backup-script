#!/bin/bash
# Intro

$id

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo "[1] Backup Pictures, Documents, Videos directories"
echo "[2] Backup all of your home directory"
echo "[3] View snapshots"
echo "[4] Remove snapshots"

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

1) sudo restic -r /media/aaronh/Backup/ backup ~/Music/ ~/Documents/ ~/Pictures/ ~/Videos/
   exit 1
   ;; 
2) sudo restic -r /media/aaronh/Backup/ backup ~/.
   exit 1
   ;;
3) sudo restic -r /media/aaronh/Backup/ snapshots
   exit 1
   ;;
4) echo "Displaying snapshots" 
   sudo restic -r /media/aaronh/Backup/ snapshots
   ;;
esac

if [ "$choice" -ne 4 ]; then
   clear
fi

echo "------------------------------------------------------"
echo "Which snapshot do you want to remove?"
echo "------------------------------------------------------"

read id

sudo restic -r /media/aaronh/Backup/ forget $id
