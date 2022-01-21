#!/bin/bash
clear
echo -e "${ORANGE}======Dropping Table======${NC}";

read -p "Enter table name you want to drop: " tbdrop
if ! [ -z $tbdrop ] && [ -f "$dbPath/$tbdrop" ]
then
	rm "$dbPath/$tbdrop"
	rm "$dbPath/desc/$tbdrop"
	echo "table '$tbdrop' removed successfully!"
	echo "==========================="
else
	echo "table '$tbdrop' doesn't exist in the database"
	echo "==========================="
fi
