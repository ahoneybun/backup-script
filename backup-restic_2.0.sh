#!/bin/bash

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