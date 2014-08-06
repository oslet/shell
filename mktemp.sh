#!/bin/sh

tempfile=`mktemp --suffix .txt` || exit 1
ls -l $tempfile
echo "This is definitely my temporary file" > $tempfile
cat $tempfile
rm -f $tempfile
