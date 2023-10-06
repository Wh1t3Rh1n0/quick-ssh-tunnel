#!/bin/bash

source settings.conf

cat resources/powershell-template.txt | \
sed -E "s/\\\$SSHUSER/$SSHUSER/g" | \
sed -E "s/\\\$SSHPORT/$SSHPORT/g" | \
sed -E "s/\\\$LHOST/$LHOST/g" | \
sed -E "s/\\\$LPORT/$LPORT/g" | \
sed -E "s/\\\$LCMD/$LCMD/g" | \
sed -E "s/\\\$WINCMD/$WINCMD/g" > webroot/ssh-tunnel.txt

cat resources/cmd-template.txt | \
sed -E "s/\\\$SSHUSER/$SSHUSER/g" | \
sed -E "s/\\\$SSHPORT/$SSHPORT/g" | \
sed -E "s/\\\$LHOST/$LHOST/g" | \
sed -E "s/\\\$LPORT/$LPORT/g" | \
sed -E "s/\\\$LCMD/$LCMD/g" | \
sed -E "s/\\\$WINCMD/$WINCMD/g" > webroot/ssh-tunnel.bat

