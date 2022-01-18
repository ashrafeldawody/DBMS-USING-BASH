#!bin/bash

source "./listDatabases.sh"

read -p "Enter database name: " dbconnect

if ! [ -z $dbconnect ] && [ -d "./databases/$dbconnect" ]; then
        export dbPath="./databases/$dbconnect"
        mkdir -p "./databases/$dbconnect/desc"
        sh "./connectedToDatabase.sh"
else
        echo "Database Doesn't Exist"
fi



