#!/bin/bash
if [ -z "$(ls -A ./databases)" ]; then #check if the directory is empty or not
   echo "There are no databases!"
else
   echo "Databases are:"
   for entry in "./databases"/*/
   do
      echo -e ${GREEN}'=> '`basename $entry`${NC}
   done
   echo "==========================="
fi
