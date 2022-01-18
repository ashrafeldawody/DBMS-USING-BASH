#!/bin/bash
COLUMNS=15
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "==========================="
echo -e "==${RED}Simple DBMS Bash Script${NC}=="
echo "==========================="
mkdir -p "./databases"
PS3="Select an option: "
select command in "Create database" "List databases" "Connect to a database" "Drop a database" "Exit"
do
	case "$REPLY" in
		"1")source "./createDataBase.sh"
			;;
		"2")source "./listDatabases.sh"
			;;
		"3")source "./connectToDatabase.sh"
			;;
		"4")source "./dropDatabase.sh"
			;;
		"5")
			exit
			;;
		*) echo -e "${RED}Invalid option!${NC}"
			echo "==========================="
			;;
	esac
done
