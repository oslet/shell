#!/bin/bash
for myfile in *.TXT
do
    mynewfile=${myfile/%.TXT/.txt}
    echo "Renaming $myfile to ${mynewfile}..."
    mv $myfile $mynewfile
    done
