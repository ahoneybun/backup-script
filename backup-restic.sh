#!/bin/bash
# Intro

$id

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo "[0] Create SFTP backup with Pi4"
echo "[1] Backup Pictures, Documents, Videos directories"
echo "[1a] Backup Pictures, Documents, Videos directories Pi4"
echo "[2] Backup all of your home directory"
echo "[2a] Backup all of your home directory Pi4"
echo "[3] View snapshots"
echo "[4] Remove snapshots"

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

0) sudo restic -r sftp:pi@10.0.0.77:/home/pi/Backups/galp3-b_restic init
   exit 1
   ;;
1) sudo restic -r /media/aaronh/ExtraDrive/Backup/ backup ~/Music/ ~/Documents/ ~/Pictures/ ~/Videos/
   exit 1
   ;; 
1a) sudo restic -r sftp:pi@10.0.0.77:/home/pi/Backups/galp3-b_restic backup ~/Music/ ~/Documents/ ~/Pictures/ ~/Videos/
    exit 1
    ;;
2) sudo restic -r /media/aaronh/ExtraDrive/Backup/ backup ~/.
   exit 1
   ;;
2a) sudo restic -r sftp:pi@10.0.0.77:/home/pi/Backups/galp3-b_restic backup ~/.
    exit 1
    ;;
3) sudo restic -r /media/aaronh/ExtraDrive/Backup/ snapshots
   exit 1
   ;;
4) echo "Displaying snapshots" 
   sudo restic -r /media/aaronh/ExtraDrive/Backup/ snapshots
   ;;
esac

if [ "$choice" -ne 4 ]; then
   clear
fi

echo "------------------------------------------------------"
echo "Which snapshot do you want to remove?"
echo "------------------------------------------------------"

read id

sudo restic -r /media/aaronh/ExtraDrive/Backup/ forget $id
