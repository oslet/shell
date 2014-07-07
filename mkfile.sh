#!/bin/bash
# wrapper for dd to act like Solaris' mkfle utility.

function usage()
{
    echo "Usage: mkfile [-i infile][-q][-b blocksize] size[k|m|g] filename"
    echo "Blocksize is 512 bytes by default."
    exit 2
}

function humanreadable()
{
    multiplier=1
    case $1 in
        *b) multiplier=1           ;;
        *k) multiplier=1024        ;;
        *m) multiplier=1048576     ;;
        *g) multiplier=1073741824  ;;
        esac
    numberic=`echo $1 | tr -d 'k'|tr -d 'm'|tr -d 'g'|tr -d 'b'`
    expr $numberic \* $multiplier
}

# mkfile uses 512 bytes blocks by default - so shall I.
bs=512
quiet=0
INFILE=/dev/zero

while getopts 'i:b:q?' argv
do
    case $argv in
        i) INFILE=$OPTARG      ;;
        b) bs=$OPTARG          ;;
        q) quiet=1             ;;
        \?) usage              ;;
        esac
    done

for i in `seq 2 ${OPTIND}`
do
    shift
    done

if [ -z "$1" ]; then
    echo "ERROR: No size specified"
    fi
if [ -z "$2" ]; then
    echo "ERROR: No filename specified"
    fi
if [ "$#" -ne "2" ]; then
    usage
    fi

size=`humanreadable $1`
filename="$2"

bs=`humanreadable $bs`

count=`expr $size / $bs`
check=`expr $count \* $bs`
if [ "$check" -ne "$size" ]; then
    echo "Warning: Due to the blocksize requested, the file created will be" "`expr $count \* $bs` bytes and not $size bytes"
    fi

echo -en "Creating $size byte file $filename...."

dd if="$INFILE" bs=$bs count=$count of="$filename" 2>/dev/null
ddresult=$?
if [ "$quiet" -ne "1" ]; then
    if [ "$ddresult" -eq "0" ]; then
        echo "Finished:"
        else
        echo "An error occurred. dd returned code $ddresult."
        fi
    # We all know that you're going to do this next - let's do it for you:
    ls -l "$filename" && ls -lh "$filename"
    fi
exit $ddresult
