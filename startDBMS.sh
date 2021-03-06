#!/bin/bash
clear
export COLUMNS=15
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export ORANGE='\033[0;33m'
export BLUE='\033[0;34m'
export NC='\033[0m' # No Color

echo "==========================="
echo -e "==${RED}Simple DBMS Bash Script${NC}=="
echo "==========================="
mkdir -p "./databases"
PS3="Select an option: "
select command in "Create database" "List databases" "Connect to a database" "Drop a database" "Exit"
do
	case "$REPLY" in
		"1")bash "./createDataBase.sh"
			;;
		"2")bash "./listDatabases.sh"
			;;
		"3")bash "./connectToDatabase.sh"
			;;
		"4")bash "./dropDatabase.sh"
			;;
		"5") exit
			;;
		*) echo -e "${RED}Invalid option!${NC}"
			echo "==========================="
			;;
	esac
done
