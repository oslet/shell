#!/bin/bash
host=$1
shift
port=80
command=${@:-HEAD /}

echo "Sending \"$command\" to $host port $port"
netcat ${host} ${port} <<EOF
${command}
EOF
echo "Done!"
