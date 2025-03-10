#!/usr/bin/env bash

local_repo () {
   echo ""
   echo "What is the destination of the repo?"
   read localInfo
}

create_snap () {
   echo "What folder(s) or file(s) do you want to backup? Use a space between folders if backing up more then one" 
   read snapCreate
}

restore_snap () {
   echo ""
   echo "Which snapsnot do you want to restore?"
   read snapRestore
}

restore_location () {
   echo ""
   echo "Where do you want to restore the snapshot?"
   read snapLocation
}

delete_snap () {
   echo "Which snapshot do you want to forget?"
   read snapDelete
}

echo ""
echo "[0] Create new repository"
echo "[1] Create new snaphot"
echo "[2] View snapshots"
echo "[3] Restore snapshot"
echo "[4] Forget snapshot"
echo ""

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

0) local_repo
   restic init --repo $localInfo
   create_snap
   restic -r $localInfo --verbose backup $snapCreate
   ;;

1) local_repo
   create_snap
   restic -r $localInfo --verbose backup $snapCreate --exclude /home/aaronh/.local/share/Steam
   ;;

2) local_repo
   restic -r $localInfo snapshots
   ;;

3) local_repo
   restic -r $localInfo snapshots
   restore_snap
   restore_location
   restic -r $localInfo restore $snapRestore --target $snapLocation
   ;;

4) local_repo
   restic -r $localInfo snapshots
   delete_snap
   restic -r $localInfo forget --prune $snapDelete
   ;;

esac
