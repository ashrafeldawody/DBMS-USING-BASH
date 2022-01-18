#!/bin/bash

source "./listTables.sh";

read -p "Enter Table name you want to select from: " tableName

header=""

for h in `awk -F: '{print $1}' "$path/desc/$tableName"`; do
    header="$header:$h"
done;
header="${header:1}"
select command in "Display All" "Select By Primary Key" "Back"
do
	case "$REPLY" in
		"1") 
            echo -e "${GREEN}$tableName: ${NC}";
            if [ -s "$path/$tableName" ]; then
                { echo "$header"; cat "$path/$tableName"; } | column -t -s ":";
            else
                echo "Table is empty!"
            fi
            echo -e "${RED}===========================${NC}";
			;;
		"2") read -p "Please enter id: " PK;
            echo -e "${GREEN}$tableName: ${NC}";
            if `grep -q "^$PK:" "$path/$tableName"`; then
                { echo "$header"; grep "^$PK:" "$path/$tableName"; } | column -t -s ":";
            else
                echo -e "${RED}No Data Found!${NC}"
            fi
            echo -e "${RED}===========================${NC}";
			;;
		"3")source "./connectedToDatabase.sh"
			;;
		*) echo "Invalid option!"
			echo "==========================="
			;;
	esac
done

