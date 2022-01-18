#!/bin/bash
read -p "Enter table name you want to drop: " tbdrop
if ! [ -z $tbdrop ] && [ -f "$path/$tbdrop" ]
then
	rm "$path/$tbdrop"
	rm "$path/desc/$tbdrop"
	echo "table '$tbdrop' removed successfully!"
	echo "==========================="
else
	echo "table '$tbdrop' doesn't exist in the database"
	echo "==========================="
fi
