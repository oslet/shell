#!/bin/bash

contacts=contacts.txt

PS3="Search For: "

select task in "Show All Information" "Show Phone" "Show Email" "Show Web"
do
  name=""
  if [ "$REPLY" -le "4" ] && [ "$REPLY" -ge "1" ]; then
      while [ -z "$name" ]
      do
          read -p "Enter a name to search for: " name
          done
      case $REPLY in
          1)
              grep -A3 -i "^Name:.*${name}" $contacts
              ;;
          2)
              grep -A1 -i "^Name:.*${name}" $contacts | cut -d: -f2-
              ;;
          3)
              grep -A2 -i "^Name:.*${name}" $contacts | grep -e "^Eamil:" -e "^Name:" | cut -d: -f2-
              ;;
          4)
              grep -A3 -i "^name:.*${name}" $contacts | grep -e "^Web:" -e "^Name:" | cut -d: -f2-
              ;;
          esac
      fi
  done
