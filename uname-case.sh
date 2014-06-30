#!/bin/bash
OS=`uname -s`

case "$OS" in
    FreeBSD) echo "This is FreeBSD" ;;
    CYGWIN) echo "This is Cygwin" ;;
    SunOS) echo "This is Solaris" ;;
    Darwin) echo "This is AIX" ;;
    Minix) echo "This is Minix" ;;
    Linux) echo "This is Linux" ;;
    *) echo "Failed to identify this OS" ;;
esac
