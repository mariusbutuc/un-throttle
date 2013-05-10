#!/bin/sh
 
LIMIT_DOWN="30Kbytes/s"
LIMIT_UP="10Kbytes/s"
 
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi
 
ipfw pipe 1 config bw $LIMIT_DOWN
ipfw pipe 2 config bw $LIMIT_UP
ipfw add 1 pipe 1 tcp from any to me
ipfw add 2 pipe 2 tcp from me to any
