#!/bin/bash

userName=$(echo $USER)

server_repo () {
   echo ""
   echo "What is the user@hostname for the server?"
   read serverInfo
   echo ""
   echo "What is the name of the folder?"
   read serverFolder
   echo ""
}

create_snap () {
   echo "What folder(s) do you want to backup? Use a space between folders if backing up more then one" 
   read snapCreate
   echo ""
}

restore_snap () {
   echo ""
   echo "Which snapsnot do you want to restore?"
   read snapRestore
   echo ""
}

restore_location () {
   echo "Where do you want to restore the snapshot?"
   read snapLocation
   echo ""
}

delete_snap () {
   echo ""
   echo "Which snapshot do you want to forget?"
   read snapDelete
   echo ""
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

0) server_repo
   restic -r sftp:$serverInfo:$serverFolder init
   create_snap
   restic -r sftp:$serverInfo:$serverFolder --verbose backup $snapCreate
   ;;

1) server_repo
    create_snap
    restic -r sftp:$serverInfo:$serverFolder --verbose backup $snapCreate --exclude /home/aaronh/.local/share/Steam 
    ;;

2) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   ;;

3) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   restore_snap
   restore_location
   restic -r sftp:$serverInfo:$serverFolder restore $snapRestore --target $snapLocation
   ;;
   
4) server_repo
   restic -r sftp:$serverInfo:$serverFolder snapshots
   delete_snap
   restic -r sftp:$serverInfo:$serverFolder forget --prune $snapDelete
   ;;

esac
