#!bin/bash

bash "./listDatabases.sh"

read -p "Enter database name: " dbconnect

if ! [ -z $dbconnect ] && [ -d "./databases/$dbconnect" ]; then
        export dbPath="./databases/$dbconnect"
        mkdir -p "./databases/$dbconnect/desc"
        bash "./connectedToDatabase.sh"
else
        echo "Database Doesn't Exist"
fi



