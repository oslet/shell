#!/bin/bash

savedir=/tmp/log.save
mkdir -p ${savedir}
cd /var/log

now=`date +%d%b%Y%H%M%S`
mkdir -p "$savedir" 2>/dev/null
for file in messages syslog dmesg daemon.log
do
    md5sum "${file}" | cut -d" " -f1 > "${savedir}/${file}.md5"
    done

while :
do
    now=`date +%d%b%Y%H%M%S`
    for file in messages syslog dmesg daemon.log
    do
        prev=`cat "$savedir/${file}.md5" || echo 0`
        if [ -s "${file}" ]; then
            # it exist and has content
            md5=`md5sum ${file} | cut -d" " -f1 | tee "${savedir}/${file}.md5"`
            if [ "prev" != "$md5" ]; then
                case "$prev" in
                    0) echo "`date`: $file appeared." ;;
                    *) echo "`date`: $file changed."
                        ;;
                    esac
                cp "${file}" "${savedir}/${file}.$now"
                fi
            else
            # it doesn't; did it exist before ?'
            if [ "$prev" != 0 ]; then
              echo "`date`: $file disappeared."
                echo 0 > "${savedir}/${file}.md5"
                fi
            fi
        done
    sleep 30
    done
