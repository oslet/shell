#!/bin/bash

function readhost
{
    host=$1
    shift
    port=80
    command="HEAD http://${host}/ HTTP/1.0"

    echo "Sending \"$command\" to $host port $port"
    netcat ${host} ${port} <<EOF
${command}
EOF
echo "Done!"
}

for host in $@
do
    readhost $host
    done
