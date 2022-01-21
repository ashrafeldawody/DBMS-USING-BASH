#!/bin/bash
clear
echo -e "${ORANGE}======Creating New Database======${NC}";
read -p "Enter Database Name: " dbname

#checking if the db name exists
if [ -d "`pwd`/databases/$dbname" ]
	then
       	echo "database already exists!"
		echo "==========================="
	else	
	    mkdir "`pwd`/databases/$dbname"
		echo "Database '"$dbname"' created successfully!"
		echo "==========================="
	fi
