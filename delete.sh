#!/bin/bash

bash "./listTables.sh";

read -p "Enter Table name you want to delete from: " tableName

if [ -z $tableName ] || ! [ -f "$dbPath/desc/$tableName" ];then
    echo -e "${RED}Invalid Table Name${NC}"; 
    bash "./select.sh";
fi

header=""

for h in `awk -F: '{print $1}' "$dbPath/desc/$tableName"`; do
    header="$header:$h"
done;
header="${header:1}"
PKName=`echo $header | awk -F: '{print $1}'`
PS3="Select an option: "
select command in "Delete All Records" "Delete By Primary Key" "Back"
do
	case "$REPLY" in
		"1") 
            echo -e "${GREEN}$tableName: ${NC}";
            if [ -s "$dbPath/$tableName" ]; then
                while true; do
                    read -p "The table will be truncated, Are you sure? (y/N)" yn
                    case $yn in
                        [Yy]* ) echo > "$dbPath/$tableName";
                        echo -e "${GREEN}Table Successfully Truncated"; break;;
                        * ) bash "./connectedToDatabase.sh"; ;;
                    esac
                done

            else
                echo "Table is already empty!"
            fi
            echo -e "${RED}===========================${NC}";
			;;
		"2") read -p "Please enter $PKName: " PKValue;
            echo -e "${GREEN}$tableName: ${NC}";
            if `grep -q "^$PKValue:" "$dbPath/$tableName"`; then
                sed -i "/^$PKValue:/d" "$dbPath/$tableName"
                echo -e "${GREEN}Record Deleted Successfully";
                sh "./connectedToDatabase.sh"      
            else
                echo -e "${RED}No Record with $PKName = $PKValue${NC}"
            fi
            echo -e "${RED}===========================${NC}";
			;;
		"3")bash "./connectedToDatabase.sh"
			;;
		*) echo "Invalid option!"
			echo "==========================="
			;;
	esac
done

