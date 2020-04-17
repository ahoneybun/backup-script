#!/bin/bash
# Intro

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo "[1] Backup Pictures, Documents, Videos directories"
echo "[2] Backup all of your home directory"
echo "[3] View snapshots"

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

1) sudo restic -r /media/aaronh/Backup/ backup ~/Music/ ~/Documents/ ~/Pictures/ ~/Videos/
   ;; 
2) sudo restic -r /media/aaronh/Backup/ backup ~/.
   ;;
3) sudo restic -r /media/aaronh/Backup/ snapshots
esac

