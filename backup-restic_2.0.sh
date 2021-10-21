#!/bin/bash

server_repo () {
   echo ""
   echo "What is the user@hostname for the server?"
   read serverInfo
   echo ""
   echo "What is the name of the folder?"
   read serverFolder
   echo ""
}

local_repo () {
   echo ""
   echo "What is the destination of the repo?"
   read localInfo
   echo ""
}

select_snap () {
   echo ""
   echo "Which snapshot do you want to forget?"
   read snapPick
   echo ""
}

echo "------------------------------------------------------"
echo "Hello $USER what would you like to do today?"
echo "------------------------------------------------------"

echo ""
echo "Be sure to use full paths"
echo ""

echo "[1] Manage SFTP repo"
echo "[2] Manage local repo"
echo ""

echo "------------------------------------------------------"
echo -n "Enter choice: "; read choice
case "$choice" in

   1) sh sftp.sh
   ;;

   2) sh local.sh
   ;;

esac