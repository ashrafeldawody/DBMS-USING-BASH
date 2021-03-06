#!/bin/bash
clear
echo -e "${ORANGE}======Dropping Database======${NC}";

bash "./listDatabases.sh"
read -p "Name of Database you want to drop: " dbnamedrop

if ! [ -z $dbnamedrop ] && [ -d "./databases/$dbnamedrop" ]
then
	rm -rf "./databases/$dbnamedrop"
        echo "'$dbnamedrop' database has been removed successfully!"
        echo "==========================="

else
        echo "database '$dbnamedrop' doesn't exist!"
        echo "==========================="
fi
