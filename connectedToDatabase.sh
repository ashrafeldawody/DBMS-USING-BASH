#!/bin/bash
echo -e "${GREEN}Connected To `basename $dbPath`${NC}"
echo -e "===================================="
PS3="Select an option: "
select command in "Create Table" "List Tables" "Drop table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table" "Back to Main Menu"
do
        case "$REPLY" in
                "1")bash "./createTable.sh"
                        ;;
                "2")bash "./listTables.sh"
                        ;;
                "3")bash "./dropTable.sh"
                        ;;
                "4")bash "./insert.sh"
                        ;;
                "5")bash "./select.sh"
                        ;;
                "6")bash "./delete.sh"
                        ;;
                "7")bash "./update.sh"
                        ;;
                "8")echo "==========================="
			bash "./mainMenu.sh"
                        ;;
                *) echo "Invalid option!"
			echo "==========================="
                        ;;
        esac
done

