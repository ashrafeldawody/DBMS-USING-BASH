#!/bin/bash

read -p "Enter table name: " tbname
while [[ $tbname = "" ]]; do
	read -p "Enter table name: " tbname
done

if test -f "$path/$tbname"
then
    echo "Table '$tbname' already exists!"
	echo "==========================="
else
	echo -e "Enter table decription: ${GREEN}Column:datatype:maxlength${NC}";
	echo -e "${GREEN}Avaiable Datatypes: number, string${NC}";
	echo "When you finish write end and press enter";
	echo -e "${RED}Primary Key Must Be Entered First${NC}";

	touch "$path/$tbname"
	touch "$path/desc/$tbname"

	while true
	do
		read -p "Enter Column definition: " col
		if [ "$col" = "end" ]; then
			break;
		fi
		#check if line consists of 3 columns Column:datatype:maxlength
		if [ `echo "$col" | awk -F: '{print NF}' | sort -nu | tail -n 1` -ne 3 ]; then
			echo "Invalid Number of columns"
			continue;
		fi
		colName=`echo "$col" | cut -d":" -f1`
		colDataType=`echo "$col" | cut -d":" -f2`
		colMaxLength=`echo "$col" | cut -d":" -f3`
		if [ -z "$colName" ]
		then
			echo "column name can't be empty"
			continue;
		fi
		if [ "$colDataType" != "number" ] && [ "$colDataType" != "string" ];then
			echo "Invalid Data Type."
			continue;
		fi
		if ! [[ "$colMaxLength" =~ ^[0-9]+$ ]];then
			echo "Invalid Max Length. Enter a valid number"
			continue;
		fi
		if `grep -q "^$colName" "$path/desc/$tbname"`; then
			echo "Column name is already used";
			continue;
		fi
		echo $col >> "$path/desc/$tbname" 
	done
	echo "Table '$tbname' created successfully!"
	echo "========Table Columns======"
	cat "$path/desc/$tbname"| column -t -s ":";
	echo "==========================="
fi
