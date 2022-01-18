#!bin/bash

source "./listDatabases.sh"

read -p "Enter database name: " dbconnect

if ! [ -z $dbconnect ] && [ -d "./databases/$dbconnect" ]; then
        path="./databases/$dbconnect"
        mkdir -p "./databases/$dbconnect/desc"
        echo "connected to '$dbconnect'!"
        echo "==========================="
        source "./connectedToDatabase.sh"
else
        echo "Database Doesn't Exist"
fi



