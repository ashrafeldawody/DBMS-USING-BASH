#!/bin/bash

sh "./listTables.sh";
dbPath="./databases/iti"
read -p "Enter Table name you want to insert to: " tableName
if ! [ -f "$dbPath/desc/$tableName" ];then
   echo -e "${RED}No Such Table${NC}"
   sh "./update.sh";
fi

echo `grep -q "^$colValue" "$dbPath/$tableName"`
if `grep -q "^$colValue" "$dbPath/$tableName"`; then
    echo "This $colName Already Exists";
    break;
fi
exit;
row=""


   validRecord=0
   colName=`echo $line | cut -d":" -f1`
   colDataType=`echo $line | cut -d":" -f2`
   colMaxLength=`echo $line | cut -d":" -f3`
   
   read -p "$colName($colDataType,Max:$colMaxLength): " colValue
   #validations
   if [ "$colDataType" = "number" ] && ! [[ "$colValue" =~ ^[0-9]+$ ]];then
		echo "$colName only accepts numbers"
		break;
   fi
   if [ "$colDataType" = "string" ] && ! [[ "${colValue}" =~ [a-zA-Z]+ ]];then
		echo "$colName must atleast conain one letter"
		break;
   fi
   if [ "$counter" -eq 1 ] && `grep -q "^$colValue" "$dbPath/$tableName"`; then
		echo "This $colName Already Exists";
		break;
    fi
    if [ `expr length $colValue` -gt "$colMaxLength" ];then
        echo "$colName is too long"
        echo "max length is $colMaxLength"
		break;
    fi
   row="$row:$colValue"
   validRecord="1"
   ((counter=counter+1));


   if [ "$validRecord" = "1" ];then
      echo "${row:1}" >> "$dbPath/$tableName"
   fi