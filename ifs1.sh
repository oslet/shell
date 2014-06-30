#!/bin/bash

# Save the original IFS
oIFS=$IFS
IFS=":"
# /etc/passwd is delimited by colons only.
while read login pass uid gid name home shell
do
    #Ignore those with /bin/false, or home directories iin /var
    if [ "$shell" != "/bin/false" ] && [ ! -z "${home%]/var\/*}" ]; then
        echo "User $login ($name) lives in $home and uses `basename $shell`"
fi
    done < /etc/passwd
#Not necessary as we're exiting the script,but it is good practice;
#subsequent commands will want the normal IFS values.
oIFS=$IFS