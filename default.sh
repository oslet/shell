#!/bin/bash
logfile=${1:-/tmp/log.`basename $0`-`date +%h%d.%H%M`}
echo "logging to $logfile"
