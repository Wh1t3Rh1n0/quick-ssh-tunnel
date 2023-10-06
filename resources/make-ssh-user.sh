#!/bin/bash

# Load settings
source ./settings.conf

# Check if SSH user already exists
if [ "$(grep -Eio '^$SSHUSER' /etc/passwd | tr -d ':')" == "$SSHUSER" ] ; then
    echo "WARNING: SSH Tunnel User already exists."
    echo "Quitting."
    exit
fi

# Create non-root user for incoming SSH connections
sudo useradd -m -r -s /bin/false $SSHUSER
echo "SSH Tunnel User ($SSHUSER) created."

# Generate the user's ssh key and set appropriate permissions
if [ ! -e "/home/$SSHUSER" ] ; then
    echo "ERROR: The ssh user's home directory (/home/$SSHUSER) does not exist."
    exit
else
    mkdir /home/$SSHUSER/.ssh
    ssh-keygen -P '' -f /home/$SSHUSER/.ssh/id_rsa
    cat /home/$SSHUSER/.ssh/id_rsa.pub > /home/$SSHUSER/.ssh/authorized_keys
    chown -R $SSHUSER /home/$SSHUSER
fi
echo "SSH key generated and added to tunnel user's authorized_keys file."

cp -v /home/$SSHUSER/.ssh/id_rsa ./webroot/key.$SSHUSER.txt
