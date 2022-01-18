#!/bin/bash
if test -z "$(ls -A "$dbPath/desc")"
then
   echo "Empty Database!"
   echo "==========================="
else
   echo "Tables:"
   for entry in "$dbPath"/desc/*; do
      echo -e ${GREEN}'=> '`basename $entry`${NC}
   done
fi

