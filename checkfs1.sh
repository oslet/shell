#!/bin/bash

logger -t checkfs -p user.info "Starting checkfs"
df | cut -c46- | grep -E -v "Use%|已用%" | while read usage filesystem
do
    if [ "${usage%\%}" -gt "85" ]; then
        logger -t checkfs -s -p user.warn "Filesystem $filesystem is at $usage"
        fi
    done
logger -t checkfs -p user.info "Finished checkfs"
