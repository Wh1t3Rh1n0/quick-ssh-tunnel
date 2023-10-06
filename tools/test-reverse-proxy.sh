#!/bin/bash

if [ "$1" == "" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
    echo "Test to make sure the SOCKS proxy port is forwarding traffic."
    echo
    echo "Usage: $0 <LOCAL SOCKS PROXY PORT>"
    exit
fi

LOCAL=$(curl -A curl -sk ifconfig.io)
REMOTE=$(curl -A curl -sk --proxy socks5://127.0.0.1:$1 ifconfig.io)

echo "Local external IP: $LOCAL"
echo "SOCKS external IP: $REMOTE"

if [ "$LOCAL" != "$REMOTE" ] && [ "$REMOTE" != "" ] ; then
    echo 'LOOKS GOOD!'
fi


