#!/bin/bas
# from http://sed.sf.net/sedline.txt
# sed 's/.$//
# sed 's/$'"/`echo \\\r`/

if [ ! "$1" ]; the
    echo "Usage: `basename $0` filename
    echo " `basename $0` converts between DOS and UNIX formats.
    echo " When called as unix2dos, it coverts to DOS format.
    echo " Otherwise, it converts to UNIX format.
    exit 1
    fi

case `basename $0` i
    unix2dos
        sed -i 's/$'"/`echo \\\r`/" $
        exit $
        ;
    *) # Default to being dos2uni
        sed -i 's/.$//' $
        exit $
        ;
    esac
exit 0
