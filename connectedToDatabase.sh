#!/bin/bash
PS3="Select an option: "
select command in "Create Table" "List Tables" "Drop table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table" "Back to Main Menu"
do
        case "$REPLY" in
                "1")source "./createTable.sh"
                        ;;
                "2")source "./listTables.sh"
                        ;;
                "3")source "./dropTable.sh"
                        ;;
                "4")source "./insert.sh"
                        ;;
                "5")source "./select.sh"
                        ;;
                "6")source "./delete.sh"
                        ;;
                "7")source "./update.sh"
                        ;;
                "8")echo "==========================="
			source "./mainMenu.sh"
                        ;;
                *) echo "Invalid option!"
			echo "==========================="
                        ;;
        esac
done

