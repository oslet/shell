#!/bin/bash

find /home/oslet/learning/shell -print | while read filename
do
    stat -c "%%attr (%a,%U,%G) /%n" "$filename"
    done
