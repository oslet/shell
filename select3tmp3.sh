#!/bin/bash
echo "Please select one to start a task; enter "quit" to quit,"
echo "or type "help" for help.Press Enter to list the options."
echo
oPS3=$PS3
PS3="Please choose a task (Enter to list options): "
time1=`date +%m%d%H%M%S`
select task in Quit "backup mobilesite" "update"
do
if [ ! -z $task ]; then
    case $REPLY in
        1) echo "Goodbye"
            break
            ;;
        2) tar zcvf html$time1.tar.gz --exclude=html/applications/webApp/cache --exclude=html/applications/webApp/zc_logs html
            ;;
        3) read -p "Please input your update package path: " updatefile
            unzip -d /var/www $updatefile
            ;;
        esac
    fi
    done
    PS3=$oPS3
