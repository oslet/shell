#!/bin/bash

md5=`mktemp /tmp/md5.XXXXXXXX`
samefiles=`mktemp /tmp/samefiles.XXXXXXXX`
matches=0
comparisons=0
combinations=0

verbose=1
size=""
dir=`pwd`
diff=0

function logmsg()
{
    if [ "$verbose" -ge "$1" ]; then
        shift
        echo "$@"
        fi
}

function cleanup()
{
    echo "Caught signal - cleaning up."
    rm -f ${md5} ${samefiles} > /dev/null
    exit 0
}

function usage()
{
    echo "Usage: `basename $0` [-e][-v verbosity][-c][-d directory]"
    echo " -e ignores empty files"
    echo " -v sets verbosity from 0 (silent) to 9 (diagnostics)"
    echo " -c actually checks the files."
    exit 2
}

# Parse options first
while getopts 'ev:1:cd:' opt
do
    case $opt in
        e) size=" -size +0  " ;;
        v) verbose=$OPTARG ;;
        d) dir=$OPTARG ;;
        c) diff=1 ;;
        esac
    done
trap cleanup 1 2 3 6 9 11 15

logmsg 3 "`date`: `basename $0` starting."
kickoff=`date +%s`

#Make sure that the temporary fiels can be created
touch $md5 || exit 1

start_md5=`date +%s`
logmsg 3 "`date`: Gathering md5 sums. Please wait."
find "${dir}" $size -type f -exec md5sum {} \; | sort > $md5
# md5sum `find ${dir} ${size} -type f -print` > $md5
# cutting out find is a lot faster, but limited to a few thousand files
done_md5=`date +%s`
logmsg 3 "`date`: md5 sums gathered. Comparing results...."
logmsg 2 "md5sum took `expr $done_md5 - $start_md5` seconds"

uniq -d -w32 $md5 | while read md5 file1
do
    logmsg 1 "Checking $file1"
    grep "^${md5}" $md5 | grep -v "^${md5}.${file1}$" | cut -c35- > $samefiles
    cat $samefiles | while read file2
    do
        duplicate=0
        if [ "$diff" -eq "1" ]; then
            diff "$file1" "$file2" > /dev/null
            if [ "$?" -eq "0" ]; then
                duplicate=1
                else
                duplicate=2
                fi
            else
            duplicate=1
            fi
        case $duplicate in
            0) ;;
            1)
                if [ "$verbose" -gt "5" ]; then
                    echo "$file2 is duplicate of $file1"
                    else
                    echo $file2
                    fi
                ;;
            2)echo "$file1 and $file2 have the same md5sum" ;;
            esac
        done
    done
endtime=`date +%s`
logmsg 2 "Total Elapsed Time `expr $endtime - $kickoff` seconds."
logmsg 2 "`date`: Done. `basename $0` found $matches matches in $comparisons comparisons."
logmsg 2 "Compared `wc -l $md5 | awk '{print $1}'` files; that makes for $combiinations combinations."
#rm -f ${md5} > /dev/null
