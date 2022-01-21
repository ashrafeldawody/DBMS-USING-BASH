#!bin/bash
clear
echo -e "${ORANGE}======Connect to database======${NC}";

bash "./listDatabases.sh"

read -p "Enter database name: " dbconnect

if ! [ -z $dbconnect ] && [ -d "./databases/$dbconnect" ]; then
        export dbPath="./databases/$dbconnect"
        mkdir -p "./databases/$dbconnect/desc"
        bash "./databaseMenu.sh"
else
        echo "Database Doesn't Exist"
fi



