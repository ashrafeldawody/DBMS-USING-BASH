#!/bin/bash
clear
echo -e "${ORANGE}======Updating Record======${NC}";

bash "./listTables.sh";
read -p "Enter Table name you want to update: " tableName
tablePath="$dbPath"/"$tableName";
tableDescPath="$dbPath"/desc/"$tableName";

if ! [ -f "$tableDescPath" ];then
   echo -e "${RED}No Such Table${NC}"
   exit;
fi

PK=`awk -F: '{print $1; exit}' $tableDescPath`;
read -p "Please Enter the $PK(PK) of target record: " PKValue

oldRecord=`grep "^$PKValue:" "$tablePath"`
newRecord="$PKValue"
if test -z $oldRecord; then
    echo "No Record with $PK = $PKValue";
    exit;
fi
oldRecord=`echo $oldRecord | cut -d ":" -f 2-`

loopCounter=2
for i in $(echo $oldRecord | sed "s/:/ /g")
do
    validRecord="0"
    colName=`awk -F: -v counter="$loopCounter" 'NR==counter{print $1}' $tableDescPath`
    colDataType=`awk -F: -v counter="$loopCounter" 'NR==counter{print $2}' $tableDescPath`
    colMaxLength=`awk -F: -v counter="$loopCounter" 'NR==counter{print $3}' $tableDescPath`
   
    read -p "$colName: " -i `echo $oldRecord | cut -d ":" -f $((loopCounter-1))` -e colValue;

    if [ "$colDataType" = "number" ] && ! [[ "$colValue" =~ ^[0-9]+$ ]];then
        echo "$colName only accepts numbers"
        break;
    fi
    if [ "$colDataType" = "string" ] && ! [[ "${colValue}" =~ [a-zA-Z]+ ]];then
        echo "$colName must atleast conain one letter"
        break;
    fi
    if [ `expr length $colValue` -gt "$colMaxLength" ];then
        echo "$colName is too long"
        echo "max length is $colMaxLength"
        break;
    fi
    newRecord="$newRecord:$colValue"
   ((loopCounter=loopCounter+1));
   validRecord="1"
done
   if [ "$validRecord" = "1" ];then
    sed -i "/^$PKValue:/c\\$newRecord" $tablePath
    echo -e "${GREEN}Record Successfully Updated${NC}"
   fi
