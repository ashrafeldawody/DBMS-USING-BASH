#!/bin/bash
if test -z "$(ls -A "$path/desc")"
then
   echo "Empty Database!"
   echo "==========================="
else
   echo "Tables:"
   for entry in $path/desc/.; do
      echo $entry
      echo -e ${GREEN}'=> '`basename $entry`${NC}
   done
fi

