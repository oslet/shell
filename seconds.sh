#!/bin/bash

SECONDS=0
timeout 60s slow_command
timeout_res=$?
if [ "$SECONDS" -lt "60" ];then
    echo "The command did not itme out;it returned after $SECONDS seconds."
    cmd_res=$timeout_res
    else
    echo "The command timed out."
fi
