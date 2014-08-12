#!/bin/bash

openssl genrsa -des3 1024 > server.key
openssl req -new -key server.key -x509 -days 3650 -out server.crt
cat server.key server.crt > server.pem

#### openssl test ####
# openssl s_server -cert /tmp/server.pem -accept 4433 -www

# openssl s_server -accept 4433 -www      //  default read ./server.pem


# openssl s_client -quiet -connect localhost:4433


#### file transfer ####
openssl s_server -quiet -accept 4433 > /tmp/data.bin &
cat /bin/ls | openssl s_client -quiet -connect localhost:4433

ls -lh /bin/ls /tmp/data.bin
