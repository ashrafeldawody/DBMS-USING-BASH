#!/bin/bash
clear

bash "./listTables.sh";

read -p "Enter Table name you want to select from: " tableName

if [ -z $tableName ] || ! [ -f "$dbPath/desc/$tableName" ];then
    echo -e "${RED}Invalid Table Name${NC}"; 
    exit;
fi

header=""

for h in `awk -F: '{print $1}' "$dbPath/desc/$tableName"`; do
    header="$header:$h"
done;
header="${header:1}"
PKName=`echo $header | awk -F: '{print $1}'`
PS3="Select an option: "
select command in "Display All" "Select By Primary Key" "Back"
do
	case "$REPLY" in
		"1") 
            echo -e "${GREEN}$tableName: ${NC}";
            if [ -s "$dbPath/$tableName" ]; then
                { echo "$header"; cat "$dbPath/$tableName"; } | column -t -s ":";
            else
                echo "Table is empty!"
            fi
            echo -e "${RED}===========================${NC}";
			;;
		"2") read -p "Please enter $PKName: " PK;
            echo -e "${GREEN}$tableName: ${NC}";
            if `grep -q "^$PK:" "$dbPath/$tableName"`; then
                { echo "$header"; grep "^$PK:" "$dbPath/$tableName"; } | column -t -s ":";
            else
                echo -e "${RED}No Data Found!${NC}"
            fi
            echo -e "${RED}===========================${NC}";
			;;
		"3")bash "./databaseMenu.sh"
			;;
		*) echo "Invalid option!"
			echo "==========================="
			;;
	esac
done

