#!/bin/bash
echo -e "${GREEN}Connected To `basename $dbPath`${NC}"
echo -e "===================================="
PS3="Select an option: "
select command in "Create Table" "List Tables" "Drop table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table" "Back to Main Menu"
do
        case "$REPLY" in
                "1")sh "./createTable.sh"
                        ;;
                "2")sh "./listTables.sh"
                        ;;
                "3")sh "./dropTable.sh"
                        ;;
                "4")sh "./insert.sh"
                        ;;
                "5")sh "./select.sh"
                        ;;
                "6")sh "./delete.sh"
                        ;;
                "7")sh "./update.sh"
                        ;;
                "8")echo "==========================="
			sh "./mainMenu.sh"
                        ;;
                *) echo "Invalid option!"
			echo "==========================="
                        ;;
        esac
done

