#!/bin/bash

cat resources/linux-template.txt | \
sed -E "s/\\\$SSHUSER/$SSHUSER/g" | \
sed -E "s/\\\$SSHPORT/$SSHPORT/g" | \
sed -E "s/\\\$LHOST/$LHOST/g" | \
sed -E "s/\\\$LPORT/$LPORT/g" | \
sed -E "s/\\\$LCMD/$LCMD/g" | \
sed -E "s/\\\$WINCMD/$WINCMD/g" > webroot/ssh-tunnel.sh


