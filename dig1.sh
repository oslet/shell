#!/bin/bash
while date | grep -E [0-9]*
do
    dig www.banggood.com >> /tmp/dig.log
    sleep 1
    dig www.banggood.com >> /tmp/dig.log
    done
